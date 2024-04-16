zi_featureflag_enabled "PYTHON" || return;

zi pack"bgn" for pyenv

if command -v "conda" &> /dev/null; then
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
fi

# eval "$(register-python-argcomplete pipx)"


# export PIPENV_VENV_IN_PROJECT=1

# # export PYENV_ROOT="$HOME/.pyenv"
# # command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# # eval "$(pyenv init -)"
