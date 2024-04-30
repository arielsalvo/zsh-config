# Ensure directory exists
mkdir -p ${ZDOTDIR}/.featureflags

# Initialize Feature Flag array
typeset -Ag ZSHCONF_FEATURES

# Load functions
mkdir -p ${ZDOTDIR}/.featureflags
setopt extended_glob
for _featurefile in ${ZDOTDIR}/.featureflags/*(.N); do
  [[ ${_featurefile:t} != '~'* ]] || continue
  [[ ${_featurefile:t} != 'README.md' ]] || continue
  typeset -gx ZSHCONF_FEATURES["${_featurefile:t}"]=$(cat ${_featurefile})
done
unset _featurefile
