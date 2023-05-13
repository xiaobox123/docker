FROM ubuntu:22.04

RUN apt-get update \
&& apt-get install curl -y

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get install -y nodejs

RUN apt-get install -y build-essential \
&& apt-get install bash -y \
&& apt-get install -y clang llvm lld wabt cmake \
&& apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
ENV CLANG clang

WORKDIR /app

COPY . .

EXPOSE 3000
 
CMD cd g1024 && npm uninstall node-sass && npm install sass && bash
