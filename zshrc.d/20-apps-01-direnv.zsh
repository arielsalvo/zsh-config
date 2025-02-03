# Install direnv from release and hook it into the shell
zinit \
  wait \
  from"gh-r" \
  as"program" \
  atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' \
  mv"direnv* -> direnv" \
  pick"direnv" \
  src="zhook.zsh" \
  lucid \
    for direnv/direnv
