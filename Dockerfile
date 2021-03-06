FROM ubuntu:bionic

# Install prerequisities for Ansible
RUN apt-get update
RUN apt-get -y install python3 python3-nacl python3-pip libffi-dev openssh-client sshpass

# Install ansible
RUN pip3 install ansible

# Copy your ansible configuration into the image
COPY /ansible /ansible
WORKDIR /ansible

RUN sed -i -e 's/\r$//' /ansible/entrypoint.sh

# Run ansible to configure things
CMD ["/bin/bash", "/ansible/entrypoint.sh"]