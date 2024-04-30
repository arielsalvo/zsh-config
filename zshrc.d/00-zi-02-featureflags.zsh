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

# List all Feature flags
function zshconf_featureflags() {
  for key in $(echo ${(k)ZSHCONF_FEATURES} | sed "s/ /\n/g" | sort); do
    echo "$key -> ${ZSHCONF_FEATURES[$key]}";
  done
}

# Test if a Feature flag is set and true
function zshconf_featureflag_enabled() {
  [[ $# < 1 ]] && return 1

  # Check if the feature is enabled
  if (( ${+ZSHCONF_FEATURES[$1]} )); then
    return 0
  else
    return 1
  fi
}
