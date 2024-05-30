# Install and activate ZINIT
# (https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#manual)
if [[ ! -d "${ZINIT[BIN_DIR]}/.git" ]]; then
  typeset -g ZINIT_FRESH=1
  command mkdir -p "$ZINIT[BIN_DIR]"
  compaudit | xargs chown -R "$(whoami)" "$ZINIT[HOME_DIR]"
  compaudit | xargs chmod -R go-w "$ZINIT[HOME_DIR]"
  command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT[BIN_DIR]"
fi
source "${ZINIT[BIN_DIR]}/zinit.zsh"
# Run post-install step
if [[ ${ZINIT_FRESH:-0} -eq 1 ]]; then
  unset ZINIT_FRESH
  exec zsh -il
  zinit self-update
fi

# Delivers the capability to install a group of plugins via a single, friendly label.
# (https://github.com/zdharma-continuum/zinit-annex-meta-plugins)
zinit light zdharma-continuum/zinit-annex-meta-plugins

# zdharma-continuum/zinit annexes (meta-plugin)
# (https://github.com/zdharma-continuum/zinit-annex-meta-plugins#the-list-of-the-meta-plugins)
zinit light @annexes
