setopt histignorealldups
setopt sharehistory

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
