# SSHd

This is a Docker image providing a SSH daemon.

## Build

```console
$ make build
```

## Usage

Starting the SSH daemon

```console
$ docker run -d -p 2222:22 --name sshd sshd:latest
```

To access the running container with ssh

```console
$ ssh root@127.0.0.1 -p 2222
```

Default password for ```root``` is ```toor```

