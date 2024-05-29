# Console tools (e.g. fd, bat, ripgrep, etc)
zi ice skip'ogham/exa'
zi load @console-tools

# Replace exa (unmaintained) with eza
if [[ "$OSTYPE" == darwin* ]]; then
  # No precompiled release for MacOS
  zi for \
    id-as'eza-cargo' \
    rustup \
    cargo'!eza -> eza' \
    lucid \
    load z-shell/0
else
  zi for \
    from'gh-r' \
    dl'https://github.com/eza-community/eza/raw/main/completions/zsh/_eza' \
    as'program' \
    sbin'**/eza -> eza' \
    eza-community/eza
fi

# eza aliases
zi for \
  has'eza' \
  wait \
  atinit'AUTOCD=0' \
  lucid \
  load z-shell/zsh-eza

# Git extras
zi ice skip'jonas/tig'
zi load @ext-git

#  Fuzzy search programs (e.g. fzf, fzy, skim and peco)
zi ice skip'fzf'
zi load @fuzzy

zi pack"bgn-binary+keys" for fzf
