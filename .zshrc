# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

if [ `tput colors` = "256" ]; then
  POWERLEVEL9K_MODE="nerdfont-complete"
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

plugins=(thefuck copypath copyfile dirhistory themes aliases git gh git-extras python tmux virtualenv)

ZSH_TMUX_UNICODE=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GOBIN=$HOME/.local/bin/
alias vim=lvim
export EDITOR=lvim
export VISUAL=lvim

# disable less behaviour of git related output
export LESS=-FRX

export TERM=screen-256color
export XDG_CONFIG_HOME=$HOME/.config

alias nvimconf='$EDITOR $HOME/.config/nvim/init.vim'
alias tmuxconf='$EDITOR $HOME/.tmux.conf'
alias zshconf='$EDITOR $HOME/.zshrc'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.gitdotfiles/.git/ --work-tree=$HOME'
compdef dotfiles='git'

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi


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
   echo -ne '\e[5 q'
}

precmd_functions+=( _reset_cursor )
