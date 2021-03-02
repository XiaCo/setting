CLICOLOR=1

alias ll='ls -lht'
alias tac='/usr/local/bin/tac'
alias topmem='ps aux | sort -k4,4nr'

alias gb86win='export CGO_ENABLED=0 && export GOOS=windows && export GOARCH=amd64 && go build'
alias gb86linux='export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=amd64 && go build'
alias gb86darwin='export CGO_ENABLED=0 && export GOOS=darwin && export GOARCH=amd64 && go build'
alias gbarmlinux='export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=arm && go build'
alias gbmip64lelinux='export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=mips64le && go build'
# 独立打包，不依赖动态链接库，需要安装glibc-static
# mac 下报错
#function gbstatic() {
#        go build -ldflags  '-linkmode "external" -extldflags "-static"' $1
#}

# git 设置代理
alias gitproxy='git config --global http.proxy "http://127.0.0.1:1087" && git config --gl
# git 取消代理
alias gitproxycancel='git config --global --unset http.proxy && git config --global --uns

# docker debug
function dockerdebug() {
    docker run --rm -it --network=container:$1 --pid=container:$1 busybox;
}
