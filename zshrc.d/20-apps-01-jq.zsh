# Install jq
# Requires Golang to be installed and in the path
zinit for \
    from'gh-r' \
    sbin'* -> jq' \
    nocompile \
  @jqlang/jq
