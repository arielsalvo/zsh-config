_zini_asdf_install() {
    # path export temporary required so the asdf script finds itself
    PATH="${PWD}/bin:$PATH"
    echo "" > asdf_hooks.zsh

    # Example install of direnv:
    # asdf plugin add direnv
    # asdf install direnv latest
    # asdf global direnv latest
    # asdf exec direnv hook zsh >> asdf_hooks.zsh # see https://github.com/asdf-community/asdf-direnv#setup
    # echo 'direnv() { asdf exec direnv "$@"; }' >> asdf_hooks.zsh
}

zi for \
    wait:'0a' \
    sbin:'bin/asdf' \
    atinit:'export ASDF_DIR="$PWD"' \
    atclone:'_zini_asdf_install' \
    atpull'%atclone' \
    src:'asdf.sh' \
    multisrc:'asdf_hooks.zsh' \
    lucid \
    light-mode \
    depth:1 @asdf-vm/asdf
