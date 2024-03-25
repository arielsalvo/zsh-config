# Load functions
mkdir -p ${ZDOTDIR}/functions.d
setopt extended_glob
for _funcfile in ${ZDOTDIR}/functions.d/*.zsh(.N); do
  [[ ${_funcfile:t} != '~'* ]] || continue
  source "${_funcfile}"
done
unset _funcfile
