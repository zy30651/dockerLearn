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

 # 更新pip版本
RUN /usr/local/bin/python -m pip install --upgrade pip

# 利用 pip 安装依赖
# Windows环境下编写的start.sh每行命令结尾有多余的\r字符，需移除。
# 利用 pip 安装依赖
RUN pip install -r requirements.txt

# 去除windows系统编辑文件中多余的\r回车空格
RUN sed -i 's/\r//' ./start.sh

# 给start.sh可执行权限
RUN chmod -R 777 ./start.sh
#   Unknown server host 'db'，疑似要关联db；所以报错
#RUN ./start.sh
