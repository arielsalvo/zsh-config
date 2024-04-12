# Show all entries in the ZI array
function zi_config() {
  for key in $(echo ${(k)ZI} | sed "s/ /\n/g" | sort); do
    echo "$key -> ${ZI[$key]}";
  done
}

# List all Feature flags
function zi_featureflags() {
  for key in $(echo ${(k)ZI_FEATURES} | sed "s/ /\n/g" | sort); do
    echo "$key -> ${ZI_FEATURES[$key]}";
  done
}

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
