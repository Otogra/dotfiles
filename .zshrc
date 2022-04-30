# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Prevents duplicates of PATH variables.
typeset -U PATH

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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


### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Automatically load .bash_profile when zsh opening
# source ~/.bash_profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

###########
# plugins #
###########

zinit lucid wait"1" for\
    light-mode OMZP::git \
    light-mode OMZP::extract \
    light-mode OMZP::gitignore \
    light-mode OMZP::cp \
    light-mode OMZP::safe-paste \
    light-mode OMZP::colored-man-pages \
    light-mode OMZP::copyfile \
    light-mode OMZP::copypath \
    light-mode OMZP::copybuffer \
    light-mode OMZP::colorize \
    light-mode OMZP::history \
    light-mode OMZP::gitignore \
    light-mode OMZP::command-not-found \

zinit lucid wait"3" for\
    light-mode dashixiong91/zsh-vscode \
    light-mode paulirish/git-open \
    light-mode romkatv/zsh-prompt-benchmark \
    light-mode JaumeRF/linkfile-zsh \
    light-mode OMZP::web-search \
    light-mode OMZP::sudo \
    light-mode OMZP::dirhistory \

zinit lucid for\
    light-mode MichaelAquilina/zsh-you-should-use \
    light-mode rupa/z \

zinit ice depth=1
zinit load jeffreytse/zsh-vi-mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLOCK

zinit ice lucid atload"export DOTBARE_DIR='$HOME/.dotfiles'"
zinit light kazhala/dotbare

zinit ice wait lucid
zinit load jimeh/zsh-peco-history

zinit ice lucid atload"bindkey '^P' history-substring-search-up ; bindkey '^N' history-substring-search-down" wait
zinit load zsh-users/zsh-history-substring-search


zinit ice lucid 
zinit load zsh-users/zsh-syntax-highlighting
zinit ice lucid 
zinit load zsh-users/zsh-autosuggestions
# zinit light zdharma-continuum/fast-syntax-highlighting


# with fzf installed by brew
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup # only can be used in tmux


# theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

#  Load starship theme
#  zinit ice as"command" from"gh-r" \
#            atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#            atpull"%atclone" src"init.zsh"
#  zinit light starship/starship
# eval "$(starship init bash)"


# with installing cowsay and fortune using brew
# zinit load babasbot/auto-fortune-cowsay-zsh

#zinit ice from'gh-r' as'program'
#zinit light sei40kr/fast-alias-tips-bin
#zinit light sei40kr/zsh-fast-alias-tips

# incr
# alias-tips
# hacker-quotes
# fd
# fzf
# tldr
# per-directory-history


#############
# functions #
#############

cdls() {
        local dir="$1"
        local dir="${dir:=$HOME}"
        if [[ -d "$dir" ]]; then
                cd "$dir" >/dev/null; ls -lAh --color=auto
        else
                echo "bash: cdls: $dir: Directory not found"
        fi
}



export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
export http_proxy="http://127.0.0.1:7890"
export https_proxy=$http_proxy
export all_proxy=socks5://127.0.0.1:7890

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy=$http_proxy
    export all_proxy=socks5://127.0.0.1:7890
    curl www.google.com
    echo -e "\n"
    echo -e "\033[32m已开启代理\033[0m"
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset all_proxy
    echo -e "已关闭代理"
}


#########
# alias #
#########

alias zshenv="vim ~/.zshenv"
alias zshrc="vim ~/.zshrc"
alias p10kzsh="vim ~/.p10k.zsh"

alias config="cd ~/.config"

alias vim='nvim'
export rh='root@192.168.100.2'
alias cproj='cd ~/CLionProjects'
alias jproj='cd ~/IdeaProjects'
alias t='todo.sh'
alias dot='cd ~/dotfiles'

alias reload='exec zsh'
alias src='exec zsh'





# pftech
export PF_INFO="ascii title host os kernel uptime pkgs memory shell editor wm de palette"
export PF_ASCII="Linux"
#export PF_COLOR=1 
export PF_COL3=5
export PF_COL1=6
export PF_COL2=8
export PF_COL4=0
pfetch
