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

## Sending commits

In case you have your git info in `~/.config/git`, it will be overriden the moment you open `vscode` with `~/.gitconfig`. Remove this file before commiting

## Custom gitlab

You can create your custom `gitlab` container with these two simple lines:

```sh
docker volume create gitlab-data
docker run --detach --hostname localhost --publish 8443:443 --publish 8080:80 --publish 2222:22 --name gitlab --restart always --volume gitlab-data:/var/opt/gitlab gitlab/gitlab-ce:latest
```

It will run on your local address with port `8080` (e.g. `http://192.168.11.144:8080/`). Log in with default `root` password and create users. You can commit to this server using ssh by creating a new ssh public key and editing `~/.ssh/config`, e.g.:

```sh
Host gitlab
  HostName 192.168.11.144
  User gigas
  Port 2222
  IdentityFile ~/.ssh/id_ed25519
  IdentitiesOnly yes
```

The container is also updatable, so you can always do `docker pull gitlab-ce:latest` before running a new entry
