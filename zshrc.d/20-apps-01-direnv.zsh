# Install direnv from release and hook it into the shell
zinit for \
  from"gh-r" \
  as"program" \
  mv"direnv* -> direnv" \
  atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' \
  pick"direnv" \
  src="zhook.zsh" \
  wait'0' lucid \
  load direnv/direnv