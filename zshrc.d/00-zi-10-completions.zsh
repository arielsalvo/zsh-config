# Disable searching for command names containing slashes in the path as it is incredibly slow
# (See PATH_DIRS entry in https://zsh.sourceforge.io/Doc/Release/Options.html#Input_002fOutput)
# (https://stackoverflow.com/questions/76746392/why-is-my-zsh-tab-completion-slow-on-commands-but-not-directories)
unsetopt pathdirs

# Add support for completions, suggestions and syntax highlighting (meta-plugin)
zi load @zsh-users+fast
