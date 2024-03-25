# Console tools (e.g. fd, bat, ripgrep, etc)
zi ice skip'ogham/exa'
zi load @console-tools

# Replace exa (unmaintained) with eza
zi for \
    from'gh-r' \
    sbin'* -> eza' \
    nocompile \
  eza-community/eza

zi ice as"completion"
zi snippet https://github.com/eza-community/eza/blob/main/completions/zsh/_eza

# Git extras
zi load @ext-git

#  Fuzzy search programs (e.g. fzf, fzy, skim and peco)
zi load @fuzzy
