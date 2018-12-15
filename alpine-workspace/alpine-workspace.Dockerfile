FROM alpine:latest
MAINTAINER Nicholas Coats version: 0.1

# setup basic linux packages
RUN apk update && apk upgrade
RUN apk add alpine-sdk
RUN apk add bash bash-doc bash-completion
RUN apk add man man-pages mdocml-apropos

# java and maven
RUN apk add openjdk8 maven

## ruby and bundler
RUN apk add ruby ruby-rdoc ruby-irb ruby-dev
RUN gem install bundler

# install nodejs (brings npm with it)
RUN apk add nodejs

# userstuff
ARG USER=coatsn
RUN adduser -s /bin/bash -h /home/${USER} -D $USER

# assume user
USER $USER
WORKDIR /home/${USER}
COPY .bashrc .

RUN mkdir /home/${USER}/src
# RUN chmod 777 /home/${USER}/src
WORKDIR /home/${USER}/src

# execute
CMD ["/bin/bash"]
