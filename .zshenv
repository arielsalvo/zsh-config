###
# Define Zsh environment variables.
###

# Even with `$ZDOTDIR` set ~/.zshenv needs to remain.
# But, you can symlink it to this file
# ln -s ~/.config/zsh/.zshenv ~/.zshenv

# Set language and locale
# (https://www.gnu.org/software/gettext/manual/html_node/The-LANGUAGE-variable.html)
export LANGUAGE="en"
# (https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html)
LOCALES=$(locale -a | egrep -i '^(en_US|C).utf-?8$')
if (( $LOCALES[(Ie)en_US] )); then
  export LANG=en_US.UTF-8
elif (( $LOCALES[(Ie)C] )); then
  export LANG=C.UTF-8
else
  export LANG=POSIX
fi

# XDG
typeset -gx XDG_CACHE_HOME=~/.cache
typeset -gx XDG_CONFIG_HOME=~/.config
typeset -gx XDG_DATA_HOME=~/.local/share
typeset -gx XDG_RUNTIME_DIR=~/.xdg

# Root for all Zsh configuration files
typeset -gx ZDOTDIR=${ZDOTDIR:-${XDG_CONFIG_HOME}/zsh}

# Ensure directories exist
mkdir -p ${XDG_CACHE_HOME} ${XDG_CONFIG_HOME} ${XDG_DATA_HOME} ${XDG_RUNTIME_DIR} ${ZDOTDIR}

# Make sure shell key bindings are Emacs
bindkey -e

# Set editors.
typeset -gx PAGER="less"
typeset -gx EDITOR="vim"
if command -v code &> /dev/null; then
  typeset -gx VISUAL="code"
else
  typeset -gx VISUAL=${EDITOR}
fi

# Regional settings.
typeset -gx TZ="America/Argentina/Buenos_Aires"

# MacOS
if [[ "$OSTYPE" == darwin* ]]; then
  # Disable Apple Terminal.app session save/restore functionality
  typeset -gx SHELL_SESSIONS_DISABLE=1
fi
