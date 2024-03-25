# Load functions
mkdir -p ${ZDOTDIR}/aliases.d
setopt extended_glob
for _aliasfile in ${ZDOTDIR}/aliases.d/*.zsh(.N); do
  [[ ${_aliasfile:t} != '~'* ]] || continue
  source "${_aliasfile}"
done
unset _aliasfile
