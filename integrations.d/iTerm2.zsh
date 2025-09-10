# Terminal Emulator integrations

# Only run if iTerm2 is the running emulator
[[ ${TERM_PROGRAM} == 'iTerm.app' ]] || return

# Run iTerm2.app integrations
INTEGRATIONS_ITERM2="${HOME}/.iterm2_shell_integration.zsh"
[[ -e "${INTEGRATIONS_ITERM2}" ]] && source "${INTEGRATIONS_ITERM2}"
