# Console tools (e.g. fd, bat, ripgrep, etc)
zinit \
  skip'dircolors-material' \
  skip'ogham/exa' \
  skip'jonas/tig' \
    for @console-tools

# Replace exa (unmaintained) with eza
if [[ "$OSTYPE" == darwin* ]]; then
  # No release for Darwin/MacOS in repo
  # Use homebrew instead
  zinit \
    id-as'eza-community/eza' \
    atclone'if ! command -v eza &> /dev/null; then brew install eza; fi' \
    atpull'brew upgrade eza' \
    atload'if ! command -v eza &> /dev/null; then brew install eza; fi' \
    atdelete'brew uninstall eza' \
    nocompile \
    lucid \
      for eza-community/eza
else
  zinit \
    from'gh-r' \
    dl'https://github.com/eza-community/eza/raw/main/completions/zsh/_eza' \
    as'program' \
    sbin'**/eza -> eza' \
      for eza-community/eza
fi

# eza aliases
# TODO: Replace z-shell with another repo
zinit \
  has'eza' \
  wait \
  atinit'AUTOCD=0' \
  lucid \
    for z-shell/zsh-eza

# Git extras
zinit \
  skip'tj/git-extras' \
    for @ext-git

#  Fuzzy search programs (e.g. fzf, fzy, skim and peco)
zinit \
  skip'fzf' \
  skip'lotabout/skim' \
    for @fuzzy

zinit \
  pack"bgn-binary+keys" \
    for fzf

zinit \
  has'fzf' \
  wait \
  lucid \
    for Aloxaf/fzf-tab

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
