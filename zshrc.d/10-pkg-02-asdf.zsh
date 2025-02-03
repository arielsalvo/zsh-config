# Install and initialize ASDF
zinit \
  wait \
  from"gh-r" \
  as"program" \
  atinit:'export ASDF_DIR="$PWD"; export ASDF_DATA_DIR="$HOME/.asdf"; [[ -f ${HOME}/.asdfrc ]] || ln -s ${ZDOTDIR}/files.d/.asdfrc ${HOME}/.asdfrc; ./asdf completion zsh > "_asdf"' \
  atpull'%atclone' \
  pick"direnv" \
  lucid \
    for @asdf-vm/asdf

# Add ASDF shim to path
path=(
  ${ASDF_DATA_DIR:-$HOME/.asdf}/shims(N)
  $path
)
