# Show all entries in the ZINIT array
function zinit_config() {
  for key in $(echo ${(k)ZINIT} | sed "s/ /\n/g" | sort); do
    echo "$key -> ${ZINIT[$key]}";
  done
}

# Pull changes from repo
alias zinit_pull="git -C ${ZDOTDIR} pull"