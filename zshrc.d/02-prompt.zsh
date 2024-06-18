case ${(U)ZSHCONF_FEATURES[DEFAULT_PROMPT]:-"P10K"} in
"P10K")
  # Load powerlevel10k theme
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
  [[ -f ${HOME}/.p10k.zsh ]] || ln -s ${ZDOTDIR}/files.d/.p10k.zsh ${HOME}/.p10k.zsh
  zinit for \
    depth'1' \
    atinit'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' \
    atload'!source ${HOME}/.p10k.zsh' \
    nocd \
      light-mode romkatv/powerlevel10k
;;
"STARSHIP")
  # Load starship theme
  # * `starship` binary as command, from github release
  # * starship setup at clone(create init.zsh, completion)
  # * pull behavior same as clone, source init.zsh
  zinit for \
    as'command' \
    from'gh-r' \
    atclone'./starship init zsh > init.zsh; ./starship completions zsh > _starship' \
    atpull'%atclone' \
    src'init.zsh' \
      light-mode starship/starship
;;
"DEFAULT"|*)
  # Use Zsh native prompt
;;
esac
