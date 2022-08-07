export EDITOR='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
