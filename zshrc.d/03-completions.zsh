
# Add support for completions, suggestions and syntax highlighting (meta-plugin)
zi load @zsh-users+fast

# Use the zsh-abbr to complement aliases/suggestions/completions
# (https://zsh-abbr.olets.dev/)
zi for \
  atload'typeset -gx ABBR_SET_EXPANSION_CURSOR=1' \
  load olets/zsh-abbr