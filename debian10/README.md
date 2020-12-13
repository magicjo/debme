# Packer Build - Debian 10

**Debian Version**: 10.7.0

**Builders**: virtualbox-iso

See the project [README.md](../README.md) for usage instructions.

## Variables

You can customize the build with variables.

#### boot_wait

The time to wait after booting. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#boot_wait).

Default: `"5s"`

#### iso_checksum

The checksum for the ISO file. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#iso_checksum).

Default: `Checksum for debian-10.7.0-amd64-netinst.iso`

#### iso_url

The url for the ISO file. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#iso_url).

Default: `Url for debian-10.7.0-amd64-netinst.iso`

#### ssh_password

A plaintext password of the end user. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#ssh_password).

Default: `"packer"`

#### ssh_timeout

The time to wait for SSH to become available. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#ssh_timeout).

Default: `"30m"`

#### ssh_username

The username of the end user. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#ssh_username).

Default: `"packer"`

#### vm_cpu

Number of virtual CPUs (`--cpus`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"1"`

#### vm_disksize

The size, in megabytes, of the hard disk. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#disk_size).

Default: `"20000" (20 GB)` 

#### vm_name

This is the name of the OVF file generated. See [Packer Documentation](https://www.packer.io/docs/builders/virtualbox/iso#vm_name).

Default: `"debian10"`

#### vm_ram

The amount of RAM memory assigned for the VM, in MB (`--memory`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"2048"`

#### vm_vbox_accelerate3d

Enables or disables hardware 3D acceleration (`--accelerate3d`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"on"`

#### vm_vbox_clipboardmode

Configures the shared clipboard (`--clipboard-mode`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"bidirectional"`

#### vm_vbox_draganddrop

Specifies the drag and drop mode (`--draganddrop`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"bidirectional"`

#### vm_vbox_graphicscontroller

Specifies the use of a graphics controller (`--graphicscontroller`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"vmsvga"`

#### vm_vbox_monitorcount

Enables multi-monitor support (`--monitorcount`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"1"`

#### vm_vbox_paravirtprovider

Specifies which paravirtualization interface used (`--paravirtprovider`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"hyperv"`

#### vm_vbox_remote

Enables and disables the VirtualBox Remote (`--vrde`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"off"`

#### vm_vbox_vram
 
Sets the amount of RAM that the virtual graphics (`--vram`). See [VirtualBox Documentation](https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm).

Default: `"32"`

### Variable Files Example

```json
{
    "boot_wait": "5s",
    "iso_checksum": "cb6795ca61326e9fa58099898e53dc6c708f4b1473687fab5679f824adc78bbe1d543f3b4aed9e56613e7b150e27d6be317efc499e25a92efefed1ed623a90a6",
    "iso_url": "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso",
    "ssh_password": "packer",
    "ssh_timeout": "30m",
    "ssh_username": "packer",
    "vm_cpu": "1",
    "vm_disksize": "20000",
    "vm_name": "debian10",
    "vm_ram": "2048",
    "vm_vbox_accelerate3d": "on",
    "vm_vbox_clipboardmode": "bidirectional",
    "vm_vbox_draganddrop": "bidirectional",
    "vm_vbox_graphicscontroller": "vmsvga",
    "vm_vbox_monitorcount": "1",
    "vm_vbox_paravirtprovider": "hyperv",
    "vm_vbox_remote": "off",
    "vm_vbox_vram": "32"
}
```

## What is installed

- `VBoxGuestAdditions`
- `Gnome`
- `sudo`
- some tools (`zip, tar, net-tools, terminator, ...`)
- `fish` with `bobthefish`
- `thefuck`
- `nvm`
- `docker`
- `vscode`, `pycharm`, `webstorm`
- `chrome`
- **...**

## Troubleshooting

#### Pycharm and Webstorm not installed

To use `pycharm` or `webstorm`, you must complete the installation (and create a desktop entry).

- [pycharm installation](https://www.jetbrains.com/help/pycharm/installation-guide.html#standalone)
- [webstorm installation](https://www.jetbrains.com/help/webstorm/installation-guide.html#standalone)

```shell
# pycharm
cd /opt/pychar*/bin
./pycharm.sh

# webstorm
cd /opt/webstorm*/bin
./WebStorm.sh
```
