# Docker image for development

This project builds a docker image that can be used as a portable dev environment which in itself is reproducible.
Note that this image depends on the UID of the user building it.
Requires 'envsubst'. 
The program is used to interpolate the username value during build.

To use:

```sh
sh build.sh
sh run.sh
```

# Release of base image

1. Make desired changes to the Dockerfile.base
2. Bump the number in the file VERSION
3. Run build-base.sh
4. Run release.sh
5. Update the FROM statement in Dockerfile
6. Commit and push all changes

Some notes worth noting:

* It may be convenient to let the shell prompt indicate that you are
  running in a docker environment.
  One way to detect that you are running in docker is to check for the
  word "docker" in '/proc/1/cgroup'.

* The "docker" group is needed in order to run docker as non-root.
  See: https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user

* The container is not able to access the home directory if SELinux is
  enabled.
  For now, SELinux must be disabled on the docker host.
  Adding the "Z" option to the -v argument (see the docker-run man page)
  could be a solution, but it fails if anything is mounted inside the
  home directory, e.g. via sshfs.
