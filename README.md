# lfsfetch
A package downloader for [LinuxFromScratch](https://linuxfromscratch.org) built with only the packages required to complete LFS (and curl).

## Installation
### Manual
For quick use you can run the program with `sh lfsfetch` or enable executing (`chmod a+x lfsfetch`) and run it with `./lfsfetch`.

To use the `lfsfetch` as a normal program, you can install it to one of the three (3) specified locations:
- `/usr/bin/` - Generic User Software Directory
- `~/.local/bin/` - Current User Only: Requires `export PATH="$PATH:$HOME/.local/bin"`
- `/opt/` - Optional Software Directory

__Recommendation__: `/usr/bin/` as it allows any user to access it.

Then run:
```sh
ln -s lfsfetch <install_location>/lfsfetch
chmod a+x <install_location>/lfsfetch
```
`ln -s`: symbolically link the program to the chosen directory.

`chmod a+x`: Allow all users to execute.

### Automatic
Provided alongside the main program is a `setup.sh` script that will automate the install and first-time setup process of the program.

It will:
- Generate a fresh copy of the config files in `/etc/lfsfetch/`
    - `settings.conf` - The user-facing configuration settings
    - `mirrorlist` - The list of repositories to use for downloads
- Run the program one (1) time to calculate and sort the speeds of each connection in the repo list

#### Install
>[!NOTE]
> You may pass an **optional** \<dir> argument to specify where the program should be installed.<br>
> The default location is `/usr/bin/`

```sh
sh setup.sh --install <dir>
```

#### Clean
Generate clean default config files; reset all files in `/etc/lfsfetch/` to their defaults.
```sh
sh setup.sh --clean
```

#### Uninstall
>[!NOTE]
> You may pass an **optional** \<dir> argument to specify where the program should be installed.<br>
> The default location is `/usr/bin/`

```sh
sh setup.sh --uninstall <dir>
```

## Run-time Flags
lfsfetch has a small set of custom run-time flags to change how it acts when you run it.
- `-f`, `--force-sort`: Force the downloader to re-sort the repositories
- `-p`, `--patch`: Check for patches instead of packages
- `-q`, `--quiet`: Suppress the majority of the output
- `-I`, `--ignore`: Ignore the checksum file

## Configuration
lfsfetch has a custom TOML-like configuration file used to modify the package manager to work the way you need it to.
> [!NOTE]
> The configuration files will default to `/etc/lfsfetch/` regardless of where this program is installed.

```toml
################################################################################
# RPKG Default configuration File                                              #
# Please edit as you see fit.                                                  #
################################################################################

# The version of LFS you are performing
VERSION="13.0"

# Backwards compatibility boolean (1 = True, 0 = False)
# Will your LFS install be using SystemD or SysV for the init system?
SYSTEMD=1

# Where the packages will be downloaded to
DIR="/mnt/lfs/sources/"

# How long the download speed tests should take before timing out
TIMEOUT=10

# How long the downloads of every package should take before timing out
MAX_TIMEOUT=300

# The list of repositories to use
REPOSITORIES="mirrorlist"

# Checksums file
MD5SUMS="md5sums"
```
> [!IMPORTANT]
> Inline comments are still unavailable, please do not attempt to use them.

> [!NOTE]
> From LFS 13.0 onward the new default will be to use SystemD instead of SysV.

## Example Usages
### Basic Download of a Package
```sh
lfsfetch linux
```
<details>
  <summary>Example Output</summary>

<img width="865" height="441" alt="Output of the lfsfetch program downloading the 'Linux' package from an LFS mirror repository" src="https://github.com/user-attachments/assets/cfa6eb88-3b1e-418e-9ebf-d685a922bc86" />

This is basic usage of lfsfetch, it will search for any file names that match the provided package, and automatically download them *if* the name and version number match what is provided in the MD5SUMS file from LFS.
</details>

---
### Download a Patch
```sh
lfsfetch --patch gcc
```
<details>
  <summary>Example Output</summary>

<img width="865" height="441" alt="Output of the lfsfetch program downloading the 'GCC' patch file" src="https://github.com/user-attachments/assets/cfa6eb88-3b1e-418e-9ebf-d685a922bc86" />

Instead of downloading a package, you will download the 'package.patch' file.
</details>
