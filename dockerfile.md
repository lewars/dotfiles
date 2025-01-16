# Docker Mounting Volumes: Bind Mount

## Author: Alistair Y. Lewars

## Table of Contents

1.  [How to Mount a Host Directory in a Container Using Docker](#orgb9ec19b)
    1.  [Recommendations](#orga72264d)
    2.  [Reference](#org6a36706)



<a id="orgb9ec19b"></a>

## How to Mount a Host Directory in a Container Using Docker

To mount host directories inside a container, use the `--mount flag`.

```bash
    docker run -d \
           -name project-user-training-0001 \
           --mount type=bind,src=/home/project/user/training-0001,dst=/data/training-0001 \
           --mount type=bind,src=/opt/anaconda3/envs/training,dst=/opt/anaconda3/envs/training,readonly
           nvidia/cuda:12.6.3-cudnn-devel-ubuntu20.04
```

Note the `--mount` flags.
The first option, `type=bind`, specifies a `bind mount`, which allows a user to make an existing directory or file on the `host` filesystem accessible within the container (`guest`).
The second mount option uses `src=<path>`  to specifies the host system directory `/home/project/user/training-0001` and mounts it to, `/data/training-0001,` in the container, specified by the `dst=<path>` option.
The third mount flag is similar to the first, but mounts the directory as read only, using the `readonly` option.

For more options available with the `--mount` command, see [Docker - Storage - Bind Mounts ](https://docs.docker.com/engine/storage/bind-mounts/#options-for---mount) - <https://docs.docker.com/engine/storage/bind-mounts/#options-for---mount>. [1]

Docker also offers the `--volume` flag for `bind mounts` with simpler syntax. For example, `--volume /home/project/user/training-0001:/data/training-0001` performs the same operations as the first `--mount` example.


<a id="orga72264d"></a>

### Recommendations

-   Mount all data volumes as directories using the `bind` type. From the container process prospective, all data is accessed using a directory, decoupling the container from underlying storage technology (e.g., a NAS resource, attached as an NFS mount).
-   Use the `--mount` flag instead of the `--volume` flag to perform `bind mounts`. `--mount` offers more options, throws an error when the source directory is missing, and is recommended by Docker Inc.
-   Use the `readonly` for directories that meant for read only access, like shared `Anaconda` libraries.
-   Use `type=tmpfs` for temporary data not needed in other mounted directories.


<a id="org6a36706"></a>

### Reference

1.  [Docker - Storage - Bind Mounts ](https://docs.docker.com/engine/storage/bind-mounts/#options-for---mount) <https://docs.docker.com/engine/storage/bind-mounts/#options-for---mount>
