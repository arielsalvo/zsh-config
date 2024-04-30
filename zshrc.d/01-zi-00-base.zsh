# Install and activate ZI
# (https://wiki.zshell.dev/docs/getting_started/installation)
if [[ ! -d "${ZI[BIN_DIR]}/.git" ]]; then
  typeset -g ZI_FRESH=1
  command mkdir -p "$ZI[BIN_DIR]"
  compaudit | xargs chown -R "$(whoami)" "$ZI[HOME_DIR]"
  compaudit | xargs chmod -R go-w "$ZI[HOME_DIR]"
  command git clone https://github.com/z-shell/zi.git "$ZI[BIN_DIR]"
fi
source "${ZI[BIN_DIR]}/zi.zsh"
# Run post-install step
if [[ ${ZI_FRESH:-0} -eq 1 ]]; then
  unset ZI_FRESH
  exec zsh -il
  zi self-update
fi
