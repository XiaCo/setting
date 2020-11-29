alias ll='ls -lht'

alias gbwin='CGO_ENABLED=0 && GOOS=windows && GOARCH=amd64 && go build'
alias gblinux='CGO_ENABLED=0 && GOOS=linux && GOARCH=amd64 && go build'
alias gbandroid='CGO_ENABLED=0 && GOOS=linux && GOARCH=arm && go build'
# 独立打包，不依赖动态链接库，需要安装glibc-static
# mac 下报错
#function gbstatic() {
#        go build -ldflags  '-linkmode "external" -extldflags "-static"' $1
#}

# git 设置代理
alias gitproxy='git config --global http.proxy "http://127.0.0.1:1087" && git config --global https.proxy "http://127.0.0.1:1087"'
# git 取消代理
alias ungitproxy='git config --global --unset http.proxy && git config --global --unset https.proxy'

# docker debug
function dockerdebug() {
    docker run --rm -it --network=container:$1 --pid=container:$1 busybox;
}
