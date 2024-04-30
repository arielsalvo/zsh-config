zshconf_featureflag_enabled "PYTHON" || return;

zi pack"bgn" for pyenv

conda_hooks() {
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$(pyenv prefix)/etc/profile.d/conda.sh" ]; then
        . "$(pyenv prefix)/etc/profile.d/conda.sh"
    else
        export PATH="$(pyenv prefix)/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
}

zi for \
  wait'!0b' \
  id-as'python-conda-hooks' \
  atload'conda_hooks' \
  has'conda' \
  light-mode \
  z-shell/0

# eval "$(register-python-argcomplete pipx)"


# export PIPENV_VENV_IN_PROJECT=1
