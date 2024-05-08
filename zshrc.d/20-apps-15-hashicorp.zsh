# Load completion for terraform if installed
zi for \
  wait'!0b' \
  has'terraform' \
  lucid \
  load \
  noahingh/terraform-oh-my-zsh-plugin


# Load completion for packer if installed
zi for \
  wait'!0b' \
  has'packer' \
  lucid \
  load \
  BreakingPitt/zsh-packer.git