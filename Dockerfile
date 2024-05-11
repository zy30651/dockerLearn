FROM python:3.8

# 镜像作者
MAINTAINER zy30651

# 设置 python 环境变量
ENV PYTHONUNBUFFERED 1

# 设置pip源为国内源
COPY pip.conf /root/.pip/pip.conf

# 在容器内/var/www/html/下创建 mysite1文件夹
RUN mkdir -p /var/www/html/djangoDocker1

# 设置容器内工作目录
WORKDIR /var/www/html/djangoDocker1

# 将当前目录文件加入到容器工作目录中（. 表示当前宿主机目录）
ADD . /var/www/html/djangoDocker1

# 利用 pip 安装依赖
# Windows环境下编写的start.sh每行命令结尾有多余的\r字符，需移除。
RUN pip install -r requirements.txt && \
    sed -i 's/\r//' ./start.sh && \
    chmod +x ./start.sh
