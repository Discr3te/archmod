# Archblocks

This repository contains my personal Arch Linux installation, which uses modules
to set up the system. It isn't meant to be cloned and run as is, since it's
tailored to my own setup and includes only the features I use. You're welcome
to fork it and make it your own.

## Install Guide

### Desktop
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main/desktop.sh)"
```

### Laptop (Lenovo Thinkcentre T14 Gen 5)
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Discr3te/archmod/refs/heads/main/laptop_t14g5.sh)"
```


## Acknowledgments
This project is heavily inspired by [altercation/archblocks](https://github.com/altercation/archblocks). I wanted a modular
way to deploy Arch Linux across multiple devices without maintaining separate,
line-by-line installation scripts for each target machine. Since the original
repository is over a decade old, this project is a complete rewrite rather than
a fork. However, it still preserves a few core structural ideas
