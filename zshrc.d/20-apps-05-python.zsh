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
    if [ -f "$__python_home/etc/profile.d/conda.sh" ]; then
        . "$__python_home/etc/profile.d/conda.sh"
    else
        export PATH="$__python_home/bin:$PATH"
    fi
    unset __python_home
    # Activate "base" environment (opinionated)
    conda activate base
}

zinit for \
    id-as'asdf-conda' \
    atclone'__asdf_python_install' \
    atload'!__asdf_conda_hooks' \
    nocompile \
    lucid \
      @zdharma-continuum/null \
    atclone'zinit cclear; zinit creinstall -q .;' \
    lucid \
      conda-incubator/conda-zsh-completion