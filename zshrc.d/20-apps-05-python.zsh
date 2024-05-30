zshconf_featureflag_enabled "PYTHON" || return;

__asdf_python_install() {
    if ! command -v asdf &> /dev/null; then
        # ASDF is not installed
        return
    fi

    if ! asdf plugin list python | grep -q "python"; then
        # ASDF's Python plugin is not installed
        asdf plugin add python
    fi

    if [[ ! -z ${ZSHCONF_FEATURES[PYTHON]} ]]; then
        # Python distro specified in feature flag
        if ! asdf list python | grep -q ${ZSHCONF_FEATURES[PYTHON]}; then
            # Specified distro not installed by ASDF
            asdf install python ${ZSHCONF_FEATURES[PYTHON]}
        fi
        touch ${HOME}/.tool-versions
        if ! sed -n "s/^python \(.*\)$/\1/p" ${HOME}/.tool-versions | grep -q ${ZSHCONF_FEATURES[PYTHON]}; then
            # Specified distro is not the global one (fallback to system)
            asdf global python ${ZSHCONF_FEATURES[PYTHON]} system
        fi
    fi
}

__asdf_conda_hooks() {
if ! command -v conda &> /dev/null; then
    # conda is not installed
    return
fi
__python_home="$(asdf where python)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$__python_home/etc/profile.d/conda.sh" ]; then
        . "$__python_home/etc/profile.d/conda.sh"
    else
        export PATH="$__python_home/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
unset __python_home
}

zinit for \
    id-as'asdf-conda-hooks' \
    atclone'!__asdf_python_install' \
    atload'!__asdf_conda_hooks' \
    lucid \
    load z-shell/0 \
    atclone'zinit cclear; zinit creinstall -q .;' \
    lucid \
    load conda-incubator/conda-zsh-completion