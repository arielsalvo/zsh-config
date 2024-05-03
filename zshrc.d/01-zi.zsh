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

# Delivers the capability to install a group of plugins via a single, friendly label.
# (https://wiki.zshell.dev/ecosystem/annexes/meta-plugins#install-meta-plugins)
zi light z-shell/z-a-meta-plugins

# ZShell:ZI annexes (meta-plugin)
# 1) z-shell∕z-a-bin-gem-node
#     Allows some types of prebuilt packs in ZI
# 2) z-shell∕z-a-readurl
#     Delivers the capability to automatically download the newest version of a file to which URL is hosted on a webpage
# 3) z-shell∕z-a-patch-dl
#     Adds the dl and patch instructions to ZI
# 4) z-shell∕z-a-rust
#     Installs rust and cargo packages locally inside the plugin or snippet directories
zi light @annexes+
