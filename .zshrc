# fzf
export FZF_DEFAULT_OPTS="--height 40% "
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


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

