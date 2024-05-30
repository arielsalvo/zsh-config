# Install and initialize ASDF
zinit for \
    sbin:'bin/asdf' \
    atinit:'export ASDF_DIR="$PWD"; [[ -f ${HOME}/.asdfrc ]] || ln -s ${ZDOTDIR}/files.d/.asdfrc ${HOME}/.asdfrc;' \
    atpull'%atclone' \
    src:'asdf.sh' \
    lucid \
    depth:1 @asdf-vm/asdf