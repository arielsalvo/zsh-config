# Ensure directory exists
mkdir -p ${ZDOTDIR}/.featureflags

# Initialize Feature Flag array
typeset -Ag ZI_FEATURES

# Load functions
mkdir -p ${ZDOTDIR}/.featureflags
setopt extended_glob
for _featurefile in ${ZDOTDIR}/.featureflags/*(.N); do
  [[ ${_featurefile:t} != '~'* ]] || continue
  typeset -gx ZI_FEATURES["${_featurefile:t}"]=1
done
unset _featurefile
