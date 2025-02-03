# Install jq
zinit \
    from'gh-r' \
    sbin'* -> jq' \
    nocompile \
      for @jqlang/jq
