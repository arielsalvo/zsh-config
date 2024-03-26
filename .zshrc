# Disable System-Wide compinit Call (Ubuntu)
skip_global_compinit=1

# Setup zprof first if we need to profile
alias zprofrc="ZPROFRC=1 zsh"
if [[ ! ${ZPROFRC:-0} -eq 0 ]]; then
  unset ZPROFRC
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
  zmodload zsh/zprof
fi

# Set ZI home directories
typeset -Ag ZI
typeset -gx ZI[HOME_DIR]="${XDG_CONFIG_HOME}/zi"
typeset -gx ZI[BIN_DIR]="${ZI[HOME_DIR]}/bin"

# Disable POWERLEVEL9K Instance Prompt during first run
if [[ ! -d "${ZI[BIN_DIR]}" ]]; then
  echo "Initializing ZI.... please wait....\n\n"
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

# Done profiling
if (type zprof &>/dev/null); then
  # Show profile results if enabled
  zprof
fi

