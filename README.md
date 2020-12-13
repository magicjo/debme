# debme 

> **DEB**ian for **ME**

This project contains the Packer build configurations for **Debian**.
Each builds a development base for use with VirtualBox.
Available builds include:

- debian buster - [`debian10` directory](./debian10)

## Requirements

The following software must be installed/present on your local machine before you can use the project.

- [`packer`](https://www.packer.io/)
- [`virtualbox`](https://www.virtualbox.org/)

### Validated with

| *Software*    	| *Version* 	|
| :---              |          ---: |
| **Windows**    	| 10 (1909) 	|
| **Packer**     	| 1.6.5     	|
| **VirtualBox** 	| 6.1.16    	|

## Usage
Make sure all the required software (listed above) is installed, 
then cd into one of the box directories and run:

```shell
# On windows
$ packer.exe build -var-file 'YOUR-VAR-FILE' debianXX.json
```

> After a few minutes, Packer should tell you the vm was generated successfully

## Authors

- **Johan Girard** - magicjo@tiglab.net

## License

This project is licensed under the MIT License - see the
[LICENSE.md](./LICENSE.md) file for details.
