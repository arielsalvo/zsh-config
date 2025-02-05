zshconf_featureflag_enabled "HOOK_LOCAL" || return;

if [[ -f "${HOME}/.zshrc.local.pre" ]]; then
  source "${HOME}/.zshrc.local.pre"
fi
