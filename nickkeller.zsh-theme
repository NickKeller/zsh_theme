function ip_addr(){
	ifconfig | grep 'inet ' | grep -v '127.0.0.1' | head -1 | cut -d" " -f2 | awk '{ print $1}'
}
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='
${ret_status} %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}(%{$fg[yellow]%}$(ip_addr)%{$reset_color%}%) in %{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)
command: '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
