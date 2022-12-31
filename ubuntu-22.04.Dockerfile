FROM ubuntu:22.04

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo Asia/Shanghai > /etc/timezone && \
    apt update && apt upgrade -y && \
    apt install -y build-essential binutils pkg-config tar zip unzip wget curl gcc g++ vim make cmake git retry golang-go zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev && \
    curl -fsL https://raw.githubusercontent.com/gitlibraries/installer/master/brew.sh | bash -s && \
    curl -fsL https://raw.githubusercontent.com/gitlibraries/installer/master/aws.sh | bash -s && \
    curl -fsL https://raw.githubusercontent.com/gitlibraries/installer/master/pyenv.sh | bash -s && \
    curl -fsL https://raw.githubusercontent.com/gitlibraries/installer/master/vcpkg.sh | bash -s && \
    retry vcpkg install boost libgo && \
    pyenv install v3.7.9 && pyenv global 3.7.9
