# WSL2 Build for debian 10

Works with:

- **Debian Version**: 10

Build for:

- **Builders**: wsl2

## Requirements

The following software must be installed/present on your local machine before you can use the project.

- [`wsl2`](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- [`debian for wsl2`](https://www.microsoft.com/p/debian/9msvkqc78pk6)

On your wsl2 `debian`, you must:

- install `git` and `debme`
```shell
sudo apt update
sudo apt install git
git clone https://github.com/magicjo/debme.git
cd debme
```

- install [`docker`](https://docs.docker.com/docker-for-windows/wsl/) for *Windows* with `wsl` integration

If you want a gui.
- [`VcXsrv`](https://techcommunity.microsoft.com/t5/windows-dev-appconsult/running-wsl-gui-apps-on-windows-10/ba-p/1493242)

### Validated with

| *Software*    	| *Version* 	|
| :---              |          ---: |
| **Windows**    	| 10 (1909) 	|
| **WSL**        	| 2         	|

## Usage

Make sure all the required software (listed above) is installed, 
then run:

```shell
# On debian
# Must use sudo only for setup
$ sudo ./debian10-wsl/setup.sh

# Then run debme (see ./debian10-wsl/debme.sh --help)
$ ./debian10-wsl/debme.sh
```

> After a few minutes, Ansible should tell you the machine was installed successfully

## Debme Options

You can customize the build with options.

#### --desktop-ui

The desktop ui to install and configure. Options: *wsl2-win*, *none*.

Default: `"none"`

```shell
$ ./debian10-wsl/debme.sh --desktop-ui wsl2-win
```

#### --dotfiles

The dotfiles archive to use. Must be a path accessible via wsl2.

Default: `not used`

```shell
$ ./debian10-wsl/debme.sh --dotfiles debme-dotfiles.tgz
```

To create your own `debme-dotfiles.tgz`, you can for example, run:
```shell
$ tar -czvf debme-dotfiles.tgz .ssh .gnupg ...
```

#### --custom-script

The custom script to use. Must be a path accessible via wsl2.

Default: `not used`

```shell
$ ./debian10-wsl/debme.sh --custom-script custom_script.sh
```

## What is installed

- `Xfce`
- `sudo`
- some tools (`zip, tar, net-tools, terminator, ...`)
- `fish` with `bobthefish`
- `thefuck`
- `nvm`
- `docker`
- `vscode`, `pycharm`, `webstorm`
- `chrome`
- dotfiles
- custom script
- **...**

## Troubleshooting

#### Hidpi option with VcXsrv

To fix blurry fonts in linux GUI applications when being run from WSL:

* [See solution thread](https://superuser.com/questions/1370361/blurry-fonts-on-using-windows-default-scaling-with-wsl-gui-applications-hidpi)

#### Set up Powerline Font

To use `powerline` in `fish shell`, you must follow the installation:

- [Tutorial: Set up Powerline in Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup)
