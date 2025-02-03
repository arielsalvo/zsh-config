# Use the zsh-abbr to complement aliases/suggestions/completions
# (https://zsh-abbr.olets.dev/)
zinit \
  atload'typeset -gx ABBR_SET_EXPANSION_CURSOR=1' \
  load \
    for olets/zsh-abbr

# Add support for completions, suggestions and syntax highlighting (meta-plugin)
# This should be the last plugin loaded
zinit load @zsh-users+fast
