# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/xia/.oh-my-zsh"
#export GOPATH=/Users/xia/go
export PATH=$PATH:/Users/xia/Desktop/gowork/pprof/FlameGraph
export PATH=$PATH:/Users/xia/go/bin
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $ZSH/kubectl.sh

# fzf
export FZF_DEFAULT_OPTS="--height 40% "
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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

CLICOLOR=1

# brew 代理
# export ALL_PROXY=socks5://127.0.0.1:1086

alias ll='ls -lht'
alias tac='/usr/local/bin/tac'
alias topmem='ps aux | sort -k4,4nr'

alias gb86win='export CGO_ENABLED=0 && export GOOS=windows && export GOARCH=amd64 && go build'
alias gb86linux='export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=amd64 && go build'
alias gb86darwin='export CGO_ENABLED=0 && export GOOS=darwin && export GOARCH=amd64 && go build'
alias gbarm64linux='export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=arm64 && go build'
alias gbmip64lelinux='export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=mips64le && go build'
# 独立打包，不依赖动态链接库，需要安装glibc-static
# mac 下报错
#function gbstatic() {
#        go build -ldflags  '-linkmode "external" -extldflags "-static"' $1
#}

# git 设置代理
alias gitproxy='git config --global http.proxy "http://127.0.0.1:1087" && git config --global https.proxy "http://127.0.0.1:1087"'
# git 取消代理
alias gitproxyCancel='git config --global --unset http.proxy && git config --global --unset https.proxy'
# 全局代理
#alias proxySocks='export ALL_PROXY=socks5://127.0.0.1:1086'
alias proxyHttp='export ALL_PROXY=http://127.0.0.1:1087'

# docker debug
function dockerdebug() {
    docker run --rm -it --network=container:$1 --pid=container:$1 busybox;
}

# golang debug
function goheapdebug() {
    go tool pprof -inuse_space http://$1:$2/debug/pprof/heap
}


function gocpusvg() {
    go tool pprof -http=:8080 -seconds 30 http://$1:$2/debug/pprof/profile
}

# $1 x.x.x.x
# $2 tcpdump参数，例：-i eth33
function wiresharkRemote() {
    mkfifo /tmp/remote
    # wireshark安装路径
    /Applications/Wireshark.app/Contents/MacOS/Wireshark -k -i /tmp/remote
    ssh root@$1 "tcpdump -s 0 -U -n -w - $2 not port 22" > /tmp/remote
}

function pythonweb() {
    python -m SimpleHTTPServer $1
}
