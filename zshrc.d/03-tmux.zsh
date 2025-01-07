zshconf_featureflag_enabled "TMUX" || return;

mkdir -p ${XDG_CONFIG_HOME}/tmux
[[ -f ${XDG_CONFIG_HOME}/tmux/tmux.conf.local ]] || ln -s ${ZDOTDIR}/files.d/tmux.conf.local ${XDG_CONFIG_HOME}/tmux/tmux.conf.local
[[ -f ${XDG_CONFIG_HOME}/tmux/tmux.conf ]] || ln -s ${ZDOTDIR}/files.d/tmux.conf ${XDG_CONFIG_HOME}/tmux/tmux.conf
