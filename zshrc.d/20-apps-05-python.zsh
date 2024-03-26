zi_featureflag_enabled "PYTHON" || return;

zi pack"bgn" for pyenv

# if type brew &>/dev/null
# then
#     # conda init -q "$(basename "${SHELL}")"

#     # >>> conda initialize >>>
#     # !! Contents within this block are managed by 'conda init' !!
#     __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#     if [ $? -eq 0 ]; then
#         eval "$__conda_setup"
#     else
#         if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
#             . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
#         else
#             export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
#         fi
#     fi
#     unset __conda_setup
#     # <<< conda initialize <<<
# fi

# eval "$(register-python-argcomplete pipx)"


# export PIPENV_VENV_IN_PROJECT=1

# # export PYENV_ROOT="$HOME/.pyenv"
# # command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# # eval "$(pyenv init -)"
