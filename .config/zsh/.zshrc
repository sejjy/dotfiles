# shellcheck shell=zsh

# [ Prompt      ]

if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
if [[ -f "$ZDOTDIR/.p10k.zsh" ]]; then
	source "$ZDOTDIR/.p10k.zsh"
fi

typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION="${USER}@${HOST}"
typeset -g POWERLEVEL9K_LOCK_ICON=""
typeset -g POWERLEVEL9K_HOME_ICON=""
typeset -g POWERLEVEL9K_HOME_SUB_ICON=""
typeset -g POWERLEVEL9K_FOLDER_ICON=""
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=""
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON="󰘬 "
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=">"
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='<'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='<'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='>'
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# [ Options     ]

setopt AUTO_CD
setopt GLOB_DOTS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HASH_LIST_ALL
setopt CORRECT

# [ Parameters  ]

ZLE_RPROMPT_INDENT=0
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=5000

# [ Environment ]

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# [ Completion  ]

autoload -Uz compinit
             compinit
zstyle ":completion:*:descriptions" format "%B%F{blue}%d%f%b"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select
zstyle ":completion:*" rehash true

# [ Plugins     ]

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
       ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
       ZVM_CURSOR_STYLE_ENABLED=false
       ZVM_VI_SURROUND_BINDKEY="s-prefix"
       ZVM_VI_HIGHLIGHT_FOREGROUND="#cdd6f4"
       ZVM_VI_HIGHLIGHT_BACKGROUND="#45475a"
       ZVM_LINE_INIT_MODE="$ZVM_MODE_INSERT"

eval   "$(zoxide init --cmd cd zsh)"

# [ Keybindings ]

bindkey -v # vi mode
bindkey "^ " autosuggest-accept

# [ Aliases     ]

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -ahlv"
alias fd="fd -H"
alias fdf="fd -tf"
alias fdd="fd -td"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log --graph"
alias glo="gl --oneline"
alias gs="git status"
alias e="nvim"

# [ Functions   ]

# pacman -F "command not found" handler
function command_not_found_handler() {
	printf "zsh: command not found: %s\n" "$1"
	local md_reset=$'\e[0m'
	local md_bright=$'\e[0;1m'
	local fg_green=$'\e[1;32m'
	local fg_purple=$'\e[1;35m'
	local files=(
		${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
	)
	if ((${#files[@]})); then
		printf "%b%s%b may be found in the following packages:\n" \
			"$md_bright" "$1" "$md_reset"
		local fields package
		local f
		for f in "${files[@]}"; do
			fields=(${(0)f})
			if [[ $package != "${fields[2]}" ]]; then
				printf "%b%s/%b%s %b%s%b\n"     \
					"$fg_purple" "${fields[1]}" \
					"$md_bright" "${fields[2]}" \
					"$fg_green"  "${fields[3]}" \
					"$md_reset"
			fi
			printf "\t/%s\n" "${fields[4]}"
			package="${fields[2]}"
		done
	fi
	return 127
}

# ranger (file manager)
function f() {
	local temp
	temp=$(mktemp)
	ranger --choosedir="$temp" "$@"
	if [[ -f $temp ]]; then
		local dir
		dir=$(< "$temp")
		rm -f "$temp"
		if [[ -d $dir && $dir != "$PWD" ]]; then
			cd "$dir" || return 1
		fi
	fi
}

# bash `help` builtin
function help() {
	bash -c "help $1"
}
