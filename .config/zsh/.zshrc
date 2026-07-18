# shellcheck shell=zsh

# Enable powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-------------#
#   Options   #
#-------------#

setopt AUTO_CD
setopt GLOB_DOTS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HASH_LIST_ALL
setopt CORRECT

#----------------#
#   Parameters   #
#----------------#

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=5000
ZLE_RPROMPT_INDENT=0

#----------------#
#   Completion   #
#----------------#

autoload -Uz compinit
compinit
zstyle ":completion:*:descriptions" format "%B%F{blue}%d%f%b"
zstyle ":completion:*" group-name ''
zstyle ":completion:*" matcher-list '' "m:{a-zA-Z}={A-Za-z}"
zstyle ":completion:*" menu select
zstyle ":completion:*" rehash true

#-------------#
#   Keymaps   #
#-------------#

bindkey -v # vi mode
bindkey "^ " autosuggest-accept

#-------------#
#   Aliases   #
#-------------#

# file
alias cp="cp -vi"
alias mv="mv -vi"
alias rm="rm -vi"
alias mkdir="mkdir -vp"

# list
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -alhv"

# find
alias fd="fd -H"
alias fdf="fd -tf"
alias fdd="fd -td"

# git
alias gcl="git clone"
alias gi="git init"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gl="git log"
alias glo="git log --all --graph --oneline"

# neovim
alias n="nvim"

#-------------#
#   Exports   #
#-------------#

# java
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# bin
export PATH="$HOME/.local/bin:$PATH"

# neovim
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# fzf
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8,fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8,selected-bg:#45475A,border:#6C7086,label:#CDD6F4"

#-------------#
#   Plugins   #
#-------------#

# better vi mode
# https://github.com/jeffreytse/zsh-vi-mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_CURSOR_STYLE_ENABLED=false
ZVM_VI_SURROUND_BINDKEY="s-prefix"
ZVM_VI_HIGHLIGHT_FOREGROUND="#cdd6f4"
ZVM_VI_HIGHLIGHT_BACKGROUND="#45475a"
ZVM_LINE_INIT_MODE="$ZVM_MODE_INSERT"

# live suggestions
# https://github.com/zsh-users/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# prompt
# https://github.com/romkatv/powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit "$ZDOTDIR/.p10k.zsh".
if [[ -f "$ZDOTDIR/.p10k.zsh" ]]; then
	source "$ZDOTDIR/.p10k.zsh"
fi

# prompt overrides
typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰣇'
typeset -g POWERLEVEL9K_LOCK_ICON=''
typeset -g POWERLEVEL9K_HOME_ICON=''
typeset -g POWERLEVEL9K_HOME_SUB_ICON=''
typeset -g POWERLEVEL9K_FOLDER_ICON=''
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=''
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON="󰘬 "
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='>'
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

#----------------#
#   Extensions   #
#----------------#

# smarter cd
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"

#---------------#
#   Functions   #
#---------------#

# pacman -F "command not found" handler
# https://wiki.archlinux.org/title/Zsh
function command_not_found_handler() {
	printf "zsh: command not found: %s\n" "$1"
	local files=(${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"})
	local md_reset="\e[0m"
	local md_bright="\e[0;1m"
	local fg_green="\e[1;32m"
	local fg_purple="\e[1;35m"
	if ((${#files[@]})); then
		printf "%b%s%b may be found in the following packages:\n" "$md_bright" "$1" "$md_reset"
		local f fields package
		for f in "${files[@]}"; do
			fields=(${(0)f})
			if [[ $package != "${fields[2]}" ]]; then
				printf "%b%s/%b%s %b%s%b\n" "$fg_purple" "${fields[1]}" "$md_bright" "${fields[2]}" "$fg_green" "${fields[3]}" "$md_reset"
			fi
			printf "\t/%s\n" "${fields[4]}"
			package="${fields[2]}"
		done
	fi
	return 127
}

# ranger
# https://github.com/ranger/ranger
function e() {
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
	bash -c "help $1" bash "$1"
}
