FROM devbox:latest

USER root
ENV USER=$USER USER_ID=$USER_ID LANG=en_IE.UTF-8
RUN mkdir -p ${HOME}; useradd ${USER} -u ${USER_ID} -d ${HOME} -M; usermod -G root $USER
USER $USER
