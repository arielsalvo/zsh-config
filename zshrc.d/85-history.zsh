# Setup shell history

# Remove superfluous blanks from each command line being added to the history list
setopt hist_reduce_blanks

# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt hist_ignore_space

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt hist_ignore_dups

# When searching for history entries in the line editor, do not display duplicates
# of a line previously found, even if the duplicates are not contiguous.
setopt hist_find_no_dups

# If the internal history needs to be trimmed to add the current command line,
# setting this option will cause the oldest history event that has a duplicate to
# be lost before losing a unique event from the list.
setopt hist_expire_dups_first

# Save each history line as soon as it's entered, and will load new history lines
# as soon as they become available. (Or more precisely, before displaying a new
# prompt; zsh won't read history while you're editing a command line.)
# The main advantage is that history lines are available immediately in all sessions.
# The main downside is that lines from different sessions will end up mixed, so lines
# that are consecutive in the history might not make any sense with respect to each other.
setopt share_history

# Keep more lines of history
export HISTSIZE=60000
export SAVEHIST=50000

if [[ "${ZSHCONF_FEATURES[HISTORY_MANAGER]:u}" == ATUIN ]]; then
  zinit \
    as"command" \
    from"gh-r" \
    bpick"atuin-*.tar.gz" \
    mv"atuin*/atuin -> atuin" \
    atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
    atpull"%atclone" src"init.zsh" \
      for atuinsh/atuin
else
  # Redirect terminal history
  mkdir -p ${ZDOTDIR}/.history
  if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    # Move history to a new file while in the VSCode console
    export HISTFILE=${ZDOTDIR}/.history/.vscode_history
  else
    export HISTFILE=${ZDOTDIR}/.history/.zsh_history
  fi
fi
