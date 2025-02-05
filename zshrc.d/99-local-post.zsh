zshconf_featureflag_enabled "HOOK_LOCAL" || return;

if [[ -f "${HOME}/.zshrc.local.post" ]]; then
  source "${HOME}/.zshrc.local.post"
fi
