# Terminal Emulator integrations

# Only run if Ghostty is the running emulator
[[ ${TERM_PROGRAM} == 'ghostty' ]] || return

# Ghostty integrations
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
  INTEGRATIONS_GHOSTTY="${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
  builtin source "${INTEGRATIONS_GHOSTTY}"
fi
