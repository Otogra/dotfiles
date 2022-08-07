#!/usr/bin/env zsh

typeset -U PATH # Prevents duplicates of PATH variables.

export TERM='xterm-256color'
export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZSH="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export HISTFILE="$ZSH_CACHE_DIR/.zhistory"        # History filepath
export HISTSIZE=50000                         # Maximum events for internal history
export SAVEHIST=10000                         # Maximum events in history file

export PATH="/usr/local/sbin:$PATH"

# homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# nginx
PATH=$PATH:/opt/nginx/sbin
# maven
export M2_HOME=/opt/maven/apache-maven-3.6.3;
PATH=$PATH:$M2_HOME/bin;
# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
# tomcat
PATH=$PATH:/opt/tomact/apache-tomcat-9.0.31/bin
# node
PATH=$PATH:/opt/node/node-v14.15.4-darwin-x64/bin
# zookeeper
export ZOOKEEPER_HOME=/opt/zookeeper/apache-zookeeper-3.7.0
export PATH=$PATH:$ZOOKEEPER_HOME/bin
# kafka
export KAFKA_HOME=/opt/kafka/kafka_2.12-2.8.1
export PATH=$PATH:$KAFKA_HOME/bin
# go
export GO_HOME=/opt/go/go1.18
export GOPATH=/opt/go/go1.18
export PATH=$PATH:$GO_HOME/bin
# midnight commander
export PATH=$PATH:/opt/kroleg/mc/bin

# mysql
# mysql is installed by brew
# use 'mysql.server start' or 'brew services start mysql'

# rust cargo
export PATH=$PATH:/Users/chenghuipeng/.cargo/bin

# don't know
export TERMINFO=/usr/share/terminfo


export PATH=$PATH:/opt/rclone/rclone-v1.59.0-osx-amd64/bin
