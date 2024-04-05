# If 1Password-CLI is installed, source the plugins configuration if one is available

if command -v "op" &> /dev/null; then
    [[ -f $HOME/.config/op/plugins.sh ]] && source $HOME/.config/op/plugins.sh
fi
