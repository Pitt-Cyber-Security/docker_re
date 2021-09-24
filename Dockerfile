FROM python:3.8
ENV TERM xterm-256color
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
    zsh \
    curl \
    strace \
    git \
    tar \ 
    gdb \
    tmux \
    vim \
    # python3 \
    # python3-pip \
    # python3-dev \
    libssl-dev \
    libffi-dev \
    build-essential

WORKDIR /root

RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit

RUN git clone https://github.com/radareorg/radare2.git 
RUN radare2/sys/install.sh

RUN pip install --upgrade pip
# COPY requirements.txt ./
RUN pip install \
    ipython \
    pwntools
RUN pip install \
    angr \
    monkeyhex
RUN pip install \
    ropper \
    r2pipe \
    clarify \
    numpy

RUN curl https://raw.githubusercontent.com/benjaminp/six/master/six.py > /usr/local/lib/python3.8/site-packages/six.py

# COPY . .

CMD /bin/zsh
