# ansible-patch-linux

This Docker container is meant to be an easy way to patch your Linux instance(s) in a semi automated fashion. It currently uses SSH User/Pass auth but I plan on switchting it to SSH keys when I have the time.

# Getting Started
#### Requirements
  - Docker installed on a host machine
  - Networking capabilities (internet)
  - A little background knowledge on Ansible

#### Running the code

First, you need to build the container image
```bash
docker build --pull --rm -f "Dockerfile" -t ansiblepatchlinux:latest "."
```
After that you must run the container and pass in any expected environment variables. The variables are listed below
| Variable | Description |
| ------ | ------ |
| SSH_HOST | The IP/DNS Record of the update target. |
| SSH_USER | The username of the account you want to SSH as. This playbook will need sudo access. |
| SSH_PASS | The password of the username from above.

You can run the playbook like so
```bash
docker run -it -e "SSH_USER=root" -e "SSH_PASS=MySSHPassword" -e "SSH_HOST=192.168.1.144"  ansiblepatchlinux:latest
```

#### Docker Compose
Optionally you can use docker-compose. I've uploaded a build of this image that you're free to use. The docker-compose.yml is an example of how you'd use it.

First, you'd want to go to the **environment** section of the **docker-compose.yml** file and replace the necessary variables.

Then you'd want to run the following code
```bash
docker-compose -f "docker-compose.yml" up --build
```

### Todos

 - Switch to SSH Key auth
