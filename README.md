# Packer Template for Docker Images

This repository contains a Packer template for building machine images
that are Docker-ready on top of Ubuntu 12.04. This involves upgrading the
kernel and installing Docker.

## Usage

First, [install Packer](http://www.packer.io/intro/getting-started/setup.html).
Then, clone this repository and `cd` into it.

Run the following:

```
$ export AWS_ACCESS_KEY_ID="your aws access key"
$ export AWS_SECRET_ACCESS_KEY="your aws secret key"
$ packer build template.json
```

At the end of that, you'll have a VirtualBox image, and an AMI, each with Docker installed, and the corresponding Vagrant *.box files.
