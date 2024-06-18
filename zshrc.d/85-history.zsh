# Setup shell history

# Remove superfluous blanks from each command line being added to the history list
setopt hist_reduce_blanks
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt hist_ignore_space
# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt hist_ignore_dups

setopt hist_find_no_dups

setopt hist_expire_dups_first

setopt share_history

# Keep more lines of history
export HISTSIZE=50000
export SAVEHIST=50000

# Redirect terminal history
mkdir -p ${ZDOTDIR}/.history
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  # Move history to a new file while in the VSCode console
  export HISTFILE=${ZDOTDIR}/.history/.vscode_history
else
  export HISTFILE=${ZDOTDIR}/.history/.zsh_history
fi
