# Test if a Feature flag is set and true
function zi_featureflag_enabled() {
  [[ $# < 1 ]] && return 1

  # Check if the feature is enabled
  if (( ${+ZI_FEATURES[$1]} )); then
    return 0
  else
    return 1
  fi
}
