# Is HomeBrew installed and in the path?
if command -v brew &> /dev/null; then

  # MacOS
  if [[ "$OSTYPE" == darwin* ]]; then
    # Execute Homebrew shell integrations
    eval "$(brew shellenv)"

    # Do not send Homebrew analytics
    export HOMEBREW_NO_ANALYTICS=1

    # Do not print any hints about changing Homebrew's behaviour with environment variables
    export HOMEBREW_NO_ENV_HINTS=1
  fi

fi
