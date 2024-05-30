# Console tools (e.g. fd, bat, ripgrep, etc)
zinit for \
  skip'dircolors-material' \
  skip'ogham/exa' \
  skip'jonas/tig' \
  load @console-tools

# Replace exa (unmaintained) with eza
if [[ "$OSTYPE" == darwin* ]]; then
  # No precompiled release for MacOS
  zinit for \
    id-as'eza-cargo' \
    rustup \
    cargo'!eza -> eza' \
    lucid \
    load z-shell/0
else
  zinit for \
    from'gh-r' \
    dl'https://github.com/eza-community/eza/raw/main/completions/zsh/_eza' \
    as'program' \
    sbin'**/eza -> eza' \
    eza-community/eza
fi

# eza aliases
zinit for \
  has'eza' \
  wait \
  atinit'AUTOCD=0' \
  lucid \
  load z-shell/zsh-eza

# Git extras
zinit for \
  load @ext-git

#  Fuzzy search programs (e.g. fzf, fzy, skim and peco)
zinit for \
  skip'fzf' \
  skip'lotabout/skim' \
  load @fuzzy

zinit for \
  pack"bgn-binary+keys" \
  load fzf
