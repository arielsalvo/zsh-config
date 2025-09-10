# Terminal Emulator integrations

# Only run if VSCode is the running emulator
[[ ${TERM_PROGRAM} == 'vscode' ]] || return

# VSCode integrations
# Run vscode integrations if not already injected
# this is recommended since injected integrations currently break this configuration
if [[ ${VSCODE_INJECTION:-0} -eq 0 ]]; then
  INTEGRATIONS_VSCODE="$(code --locate-shell-integration-path zsh)"
  [[ -e "${INTEGRATIONS_VSCODE}" ]] && builtin source "${INTEGRATIONS_VSCODE}"
fi
