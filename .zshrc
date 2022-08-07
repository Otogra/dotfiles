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

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

###########
# plugins #
###########

zinit wait"1" lucid light-mode for\
    OMZP::git \
    OMZP::extract \
    OMZP::gitignore \
    OMZP::cp \
    OMZP::safe-paste \
    OMZP::colored-man-pages \
    OMZP::copyfile \
    OMZP::copypath \
    OMZP::copybuffer \
    OMZP::colorize \
    OMZP::history \
    OMZP::gitignore \
    OMZP::command-not-found \

zinit wait"3" lucid light-mode for\
    dashixiong91/zsh-vscode \
    paulirish/git-open \
    romkatv/zsh-prompt-benchmark \
    OMZP::web-search \
    OMZP::sudo \
    OMZP::dirhistory \

zinit wait lucid light-mode for\
    atload'export YSU_MESSAGE_POSITION="after"' \
        MichaelAquilina/zsh-you-should-use \
        rupa/z \
        jimeh/zsh-peco-history \
    atload"export DOTBARE_DIR='$HOME/.dotfiles' ; _dotbare_completion_cmd" \
        kazhala/dotbare \
        urbainvaes/fzf-marks

# pfetch
zinit ice as"program" \
    atload'export PF_INFO="ascii title host os kernel uptime pkgs memory shell editor wm de palette";
           export PF_ASCII="Linux"; export PF_COL3=5; export PF_COL1=6; export PF_COL2=8; pfetch'
zinit snippet 'https://github.com/dylanaraps/pfetch/blob/master/pfetch'


# vimode
zinit ice depth"1" \
    atload'ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM ;
           ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK ;
           ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK ;
           ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK ;
           ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLOCK '
zinit load jeffreytse/zsh-vi-mode

# forgit, not be uesd for now
# zinit ice wait lucid
# zinit load 'wfxr/forgit'

zinit wait lucid light-mode for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
  bindmap'!"^P" -> history-substring-search-up; !"^N" -> history-substring-search-down' \
    zsh-users/zsh-autosuggestions \
  atload"bindkey '^P' history-substring-search-up ; bindkey '^N' history-substring-search-down" \
    zsh-users/zsh-history-substring-search \
  atload"zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup" \
    Aloxaf/fzf-tab


# p10k
zinit ice depth"1" \
    atload'!source ~/.p10k.zsh'
zinit light romkatv/powerlevel10k

#  Load starship theme
#  zinit ice as"command" from"gh-r" \
#            atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#            atpull"%atclone" src"init.zsh"
#  zinit light starship/starship
# eval "$(starship init bash)"


# with installing cowsay and fortune using brew
# zinit load babasbot/auto-fortune-cowsay-zsh

# hacker-quotes fzf per-directory-history


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



# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
# export http_proxy="http://127.0.0.1:7890"
# export https_proxy=$http_proxy
# export all_proxy=socks5://127.0.0.1:7890
# 
# function proxy_on() {
#     export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
#     export http_proxy="http://127.0.0.1:7890"
#     export https_proxy=$http_proxy
#     export all_proxy=socks5://127.0.0.1:7890
#     curl www.google.com
#     echo -e "\n"
#     echo -e "\033[32m已开启代理\033[0m"
# }
# 
# function proxy_off(){
#     unset http_proxy
#     unset https_proxy
#     unset all_proxy
#     echo -e "已关闭代理"
# }


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
alias dot='dotbare'

alias reload='exec zsh'
alias src='exec zsh'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
