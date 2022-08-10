FROM golang:1.19-alpine

LABEL maintainer="cnbattle@qiaicn@gmail.com"
LABEL website="https://github.com/cnbattle/docker-go"

RUN apk --no-cache add ca-certificates tzdata make git gcc g++ openssh-server && \
     go install github.com/go-task/task/v3/cmd/task@latest && \
     go install github.com/swaggo/swag/cmd/swag@latest && \
     cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
     sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config  && \
     ssh-keygen -t rsa -P ""  -f /etc/ssh/ssh_host_rsa_key && \
     ssh-keygen -t ecdsa -P ""  -f /etc/ssh/ssh_host_ecdsa_key && \
     ssh-keygen -t ed25519 -P ""  -f /etc/ssh/ssh_host_ed25519_key && \
     echo "root:admin" | chpasswd
# 开放22端口
EXPOSE 22
# 执行ssh启动命令
CMD [ "/usr/sbin/sshd" ,  "-D" ]
