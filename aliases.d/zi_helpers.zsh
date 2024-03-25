# Show all entries in the ZI array

alias zi_config='for key in $(echo ${(k)ZI} | sed "s/ /\n/g" | sort); do echo "$key -> ${ZI[$key]}"; done'
alias zi_featureflags='for key in $(echo ${(k)ZI_FEATURES} | sed "s/ /\n/g" | sort); do echo "$key -> ${ZI_FEATURES[$key]}"; done'
