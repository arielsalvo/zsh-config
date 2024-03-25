# MacOS integrations
if [[ "$OSTYPE" == darwin* ]]; then
  if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    # Run iTerm2.app integrations
    INTEGRATIONS_ITERM2="${HOME}/.iterm2_shell_integration.zsh"
    [[ -e "${INTEGRATIONS_ITERM2}" ]] && source "${INTEGRATIONS_ITERM2}"
  fi
fi

# VSCode integrations
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  # Run vscode integrations if not already injected
  # this is recommended since injected integrations currently break this configuration
  if [[ ${VSCODE_INJECTION:-0} -eq 0 ]]; then
    INTEGRATIONS_VSCODE="$(code --locate-shell-integration-path zsh)"
    [[ -e "${INTEGRATIONS_VSCODE}" ]] && source "${INTEGRATIONS_VSCODE}"
  fi
fi
