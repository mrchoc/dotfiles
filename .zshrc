# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export GPG_TTY=$TTY
export PATH="/opt/homebrew/opt/gradle@7/bin:$PATH"
export BAT_THEME="rose-pine"

# test startup time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR=nvim
export XDG_CONFIG_HOME="/Users/ryanloh/.config"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(nvm git kubectl aws docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias python2="/Users/ryanloh/.pyenv/versions/2.7.18/bin/python2.7"
alias pip2="/Users/ryanloh/.pyenv/versions/2.7.18/bin/pip2.7"


alias ls="eza"
alias la="eza -a"
alias ll="eza -lah"
function ld() {
    eza -lahTL "$1"
}
alias vim="nvim"

alias yabai.up='$HOME/.config/yabai/./update.sh'

function loadenv() {
    export $(cat $1 | xargs)
}

function ntfy() {
    EXITCODE=$?
    test $EXITCODE -eq 0 && curl -d "command completed ✅" ntfy.sh/$1 || curl -d "command failed ❌" ntfy.sh/$1;
}
export K9S_CONFIG_DIR=/Users/ryanloh/.config/k9s


export PATH="/Users/ryanloh/go/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#_CONDA_ROOT="/Users/ryanloh/miniforge3"
# Copyright (C) 2012 Anaconda, Inc
# SPDX-License-Identifier: BSD-3-Clause
#\. "$_CONDA_ROOT/etc/profile.d/conda.sh" || return $?
#conda activate "$@"
PROMPT=$(echo $PROMPT | sed 's/(base) //')
export PATH="/Users/ryanloh/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"

#dotfiles repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

#compile and run functions
function ccomnf() {
    clang "$1".c -o "$1" && ./"$1"
}
function ccom() {
    clang "$1".c -g -O1 -Werror -fno-omit-frame-pointer -fno-optimize-sibling-calls -fsanitize=undefined,integer,nullability,address -fsanitize-address-use-after-scope -lm -o "$1" && ./"$1"
}
function jcom() {
    javac "$1".java && java "$1"
}

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# brew clang
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# java
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.13/libexec/openjdk.jdk/Contents/Home"
# export JAVA_HOME="/opt/homebrew/opt/openjdk@21/bin/java"
# export JAVA_HOME=$(/usr/libexec/java_home)

# pomodoro
alias work="timer 25m && osascript -e 'display notification \"Work Timer is up! Take a Break 😊\" with title \"Pomodoro\"'"

alias rest="timer 5m && osascript -e 'display notification \"Break is over! Get back to work 😬\" with title \"Pomodoro\"'"

# openvpn
export PATH="/opt/homebrew/Cellar/openvpn/2.6.0/sbin:$PATH"

export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source ~/.config/zsh/rose-pine-zsh/rose-pine-zsh.zsh
colorize_zsh "rose-pine"

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Created by `pipx` on 2025-07-14 15:03:41
export PATH="$PATH:/Users/ryanloh/.local/bin"

# bun completions
[ -s "/Users/ryanloh/.bun/_bun" ] && source "/Users/ryanloh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ryanloh/.lmstudio/bin"
# End of LM Studio CLI section


# OpenClaw Completion
source <(openclaw completion --shell zsh)
