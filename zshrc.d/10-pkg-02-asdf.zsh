# Install and initialize ASDF
zinit \
  wait \
  from"gh-r" \
  as"program" \
  atinit:'export ASDF_DIR="$PWD"; [[ -f ${HOME}/.asdfrc ]] || ln -s ${ZDOTDIR}/files.d/.asdfrc ${HOME}/.asdfrc;' \
  atpull'%atclone' \
  pick"direnv" \
  lucid \
  for @asdf-vm/asdf
