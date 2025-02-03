# Disable System-Wide compinit Call (Ubuntu)
skip_global_compinit=1

# Set ZINIT home directories
typeset -Ag ZINIT
typeset -gx ZINIT[HOME_DIR]="${XDG_CONFIG_HOME}/zinit"
typeset -gx ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
typeset -gx ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zcompdump"

# Disable POWERLEVEL9K Instance Prompt during first run
if [[ ! -d "${ZINIT[BIN_DIR]}" ]]; then
  echo "Initializing ZINIT.... please wait....\n\n"
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the list of directories that cd searches
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  ${HOME}/.local/bin(N)
  ${HOME}/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

# Run configurations
mkdir -p ${ZDOTDIR}/zshrc.d
setopt extended_glob
for _rcfile in ${ZDOTDIR}/zshrc.d/*.zsh(.N); do
  [[ ${_rcfile:t} != '~'* ]] || continue
  source "${_rcfile}"
done
unset _rcfile

# Disable searching for command names containing slashes in the path as it is incredibly slow
# (See PATH_DIRS entry in https://zsh.sourceforge.io/Doc/Release/Options.html#Input_002fOutput)
# (https://stackoverflow.com/questions/76746392/why-is-my-zsh-tab-completion-slow-on-commands-but-not-directories)
unsetopt pathdirs

# Done profiling
if command -v zprof &> /dev/null; then
  # Show profile results if enabled
  zprof | less -SR
fi
