# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

source ~/.zplug/init.zsh
zplug "kutsan/zsh-system-clipboard"
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

export AUTOSWITCH_DEFAULT_PYTHON=python3
# zplug "b4b4r07/zsh-vimode-visual"
# zplug "jeffreytse/zsh-vi-mode"

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

if [ `tput colors` = "256" ]; then
  POWERLEVEL9K_MODE="nerdfont-complete"
  export COLORTERM=truecolor
fi

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# thefuck autoswitch_virtualenv
plugins=(vi-mode copypath copyfile dirhistory themes aliases git gh git-extras python tmux virtualenv )

ZSH_TMUX_UNICODE=true
# ZSH_TMUX_AUTOSTART=true


source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

HOME_PC=false
if [ $(hostname | grep 'pop-os') ]
then
    HOME_PC=true
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GOBIN=$HOME/.local/bin/

alias vim=lvim
export EDITOR=lvim
export SUDO_EDITOR=lvim
export VISUAL=lvim

# disable less behaviour of git related output
export LESS=-FRX

export TERM=screen-256color
export XDG_CONFIG_HOME=$HOME/.config
export GPG_TTY=$(tty)

alias nvimconf='$EDITOR $HOME/.config/nvim/init.vim'
alias tmuxconf='$EDITOR $HOME/.tmux.conf'
alias zshconf='$EDITOR $HOME/.zshrc'
alias alaconf='$EDITOR $HOME/.config/alacritty/alacritty.yml'
alias kittyconf='$EDITOR $HOME/.config/kitty/kitty.conf'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.gitdotfiles/.git/ --work-tree=$HOME'
compdef dotfiles='git'

# compact dotfiles alias
alias cdf='dotfiles'
compdef cdf='git'

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='
--height=40% --layout=reverse --info=inline --border --margin=1 --padding=1
--color=fg:#e6efff,bg:#1C1D24,hl:#8cb8ff
    --color=fg+:#e6efff,bg+:#1C1D24,hl+:#8a87de
    --color=info:#ffcb6b,prompt:#C3E88D,pointer:#d67cde
    --color=marker:#d67cde,spinner:#ffcb6b,header:#8cb8ff'


# #121317
# #1C1D24
# #252730
# #3E4452
#
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
# Bindings
# bindkey "^R" history-incremental-pattern-search-backward
# bindkey "^S" history-incremental-pattern-search-forward

# Custom functions



update_code() {
    DOWNLOAD_DEB_LINK='https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'

    wget -O /tmp/code.deb $DOWNLOAD_DEB_LINK
    sudo dpkg -i /tmp/code.deb
    rm /tmp/code.deb
}

# Recursevely run a sed command
recsed() {
    if [ $# -eq 2 ]; then
        target_path=$1
        sed_command=$2

        find $target_path -type f -exec sed -i "$sed_command" {} \;
    elif [ $# -eq 3 ]; then
        target_path=$1
        sed_command=$3
        name_glob=$2

        find $target_path -type f -name "$name_glob" -exec sed -i "$sed_command" {} \;
    else
        echo "Usage: rename <target_path> <sed_command>"
        echo "Usage: rename <target_path> <name_glob> <sed_command>"
    fi
}

recawk() {
    if [ $# -eq 2 ]; then
        target_path=$1
        awk_command=$2

        find $target_path -type f -exec awk "$awk_command" {} \;
    elif [ $# -eq 3 ]; then
        target_path=$1
        awk_command=$3
        name_glob=$2

        find $target_path -type f -name "$name_glob" -exec awk "$awk_command" {} \;
    else
        echo "Usage: rename <target_path> <awk_command>"
        echo "Usage: rename <target_path> <name_glob> <awk_command>"
    fi
}

reloadst() {
    xrdb -remove
    xrdb -merge -I$HOME ~/.Xresources
    killall -s USR1 st
}

reloadzsh() {
    exec zsh
}

#
# vim mode config
# ---------------

# Activate vim mode.
bindkey -v

# Set visual hightlight color.
zle_highlight=( region:bg=#3e4452,fg=#e6efff )

# Remove mode switching delay.
KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K vicmd 
    echo -ne '\e[1 q'
}

zle -N zle-line-init

# execute functions before the prompt is called

# reset cursor style:
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.

_reset_cursor() {
   echo -ne '\e[1 q'
}

precmd_functions+=( _reset_cursor )

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/scripts:$PATH

# Keep this export at the end cause it gets overriden somewhere and I am too lazy to find out where
# Removes p10k indentation, which is annoying
export ZLE_RPROMPT_INDENT=0


# Launch tmux if not already running
# if [ -z "$TMUX"  ]; then
#     tmux new-session -A -s main
# fi

export PATH=/usr/lib/cuda/bin:$HOME/.local/bin:$PATH


# # fnm
# export PATH="/root/.local/share/fnm:$PATH"
# eval "`fnm env`"

eval `ssh-agent -s` >> /dev/null


# export RUSTC_WRAPPER=sccache cargo install

# ensure Ctrl-D works
# stty eof ^D
zplug load 
