_zini_asdf_install() {
    # path export temporary required so the asdf script finds itself
    PATH="${PWD}/bin:$PATH"
    asdf plugin add direnv
    asdf install direnv latest
    asdf global direnv latest
    # see https://github.com/asdf-community/asdf-direnv#setup
    asdf exec direnv hook zsh > asdf_direnv_hook.zsh
    echo 'direnv() { asdf exec direnv "$@"; }' >> asdf_direnv_hook.zsh
}

zi wait:'0b' \
    lucid \
    light-mode \
    sbin:'bin/asdf' \
    atinit:'export ASDF_DIR="$PWD"' \
    atclone:'_zini_asdf_install' \
    src:'asdf.sh' \
    multisrc:'asdf_direnv_hook.zsh' \
    for \
    depth:1 @asdf-vm/asdf
