# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH="/usr/local/bin:$PATH"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export TERM=xterm-256color

# 后台执行渲染进程，实现背景透明
compton -b

# User specific aliases and functions

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

source /usr/share/git-core/contrib/completion/git-prompt.sh
source /home/yangyongsheng/.timewarrior/timew-completion.bash
# export PS1="\e[0;36m\u@\w$(__git_ps1 '[%s]')\e[0m\]\$ "

# 使用 lsd 取代 ls，带有色彩显示
alias ls='lsd'

alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lf='ls -F'

# ranger config
alias ra='ranger'
export RANGER_LOAD_DEFAULT_RC=FALSE

# git config
source ~/.git-prompt.sh

# tmux alias
alias tnew='tmux new-session -s'
alias tml='tmux list-sessions'
alias tma='tmux attach-session -t'
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias xterminal='xfce4-terminal'

alias gitamend='git commit --amend'
alias gitst='git status'
# bat 相关的配置 https://github.com/sharkdp/bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# powerline PS1
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }
#
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi
#
#source ~/.pureline/pureline ~/.pureline.conf
# https://gist.github.com/justintv/168835
#export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
# export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ☀ \[\033[0m\] '

export PS1='\033[0;32m┏─╼\033[0m\033[0;36m\][\u]\033[0m\033[0;32m╾─╼\033[0m\033[0;36m[\t]\033[0m\033[0;32m╾─╼\033[0m\033[0;36m[$?]\033[0m\n\033[0;32m┗─╼\033[0m\033[0;36m[\w$(__git_ps1)]\033[0m\n\033[0;36m▸\033[0m'
