# Show all entries in the ZI array
function zi_config() {
  for key in $(echo ${(k)ZI} | sed "s/ /\n/g" | sort); do
    echo "$key -> ${ZI[$key]}";
  done
}
