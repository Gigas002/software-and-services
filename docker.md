# Docker arch testing environment

Instructions to create simple, ready for testing container with `archlinux` in it to do some experiments on fresh install

Base image: https://hub.docker.com/_/archlinux/

## Commands

**Get/update image:**

```sh
docker pull archlinux:multilib-devel
```

**Run container once:**

```sh
docker run -itv "/host/directory/to/mount:/container/directory/to/mount" --rm archlinux:multilib-devel
```

**Create named container:**

Here, replace the %name% with your desired name

```sh
docker create -itv "/host/directory/to/mount:/container/directory/to/mount" --name %name% archlinux:multilib-devel
```

**Start the container:**

You can use container id if you have not specified name for it

```sh
docker start -ai %name%
```

## Build image with root account for packages installation

This can be either done manually using container, created by official archlinux image, or you can create your own image, based on it

In this example, replace %user% with your desired username and %password% with your password:

```dockerfile
FROM archlinux:multilib-devel AS runner

# uncomment wheel group to make new user root
RUN sed -i 's/^# %wheel/%wheel/' /etc/sudoers

# update packages
RUN sudo pacman -Syuu --noconfirm

# install dev packages
RUN sudo pacman -S --noconfirm --needed git base-devel

# add new user
RUN useradd -rms /bin/bash -g root -G wheel -p "$(openssl passwd -6 %password%)" %user%
USER %user%
WORKDIR /home/%user%

ENTRYPOINT ["/bin/bash"]
```

**Building the image:**

Replace the %image_name% with your desired name:

```sh
docker build . -t %image_name%:latest
```
