#copy into your .oh-my-zsh/custom/themes directory

function get_host {
	echo '@'$HOST
}

PROMPT='[ %~$(git_prompt_info) ] » '
RPROMPT=''


ZSH_THEME_GIT_PROMPT_DIRTY=" - %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" - %{$fg[default]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" - " 
ZSH_THEME_GIT_PROMPT_SUFFIX=""
