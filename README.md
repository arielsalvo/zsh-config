# Ari's ZShell configuration

## Intro and Basics

This is my own personal ZShell configuration so it matches my workflow/likes/needs.
Recommendations and PRs are appreciated but, if it doesn't improve the setup for me, you are probably better of forking and modifying it yourself.

* Based on [Zdharma-continuum:ZINIT](https://github.com/zdharma-continuum/zinit)
* Designed (sometimes over-designed) to be as modular as possible
* Portable
  * MacOS
  * Ubuntu
    * Windows (WSL)
    * Linux

## TLDR
* This repository should be cloned to `$ZDOTDIR` (preferrably: `$HOME/.config/zsh`)
* To enable the configuration, symlink `$ZDOTDIR/.zshenv` to `$HOME/.zshenv`
* $ZDOTDIR is implied from the real location of `.zshenv` (changing it is untested)
* The rest of the configuration is self-deployed during the first run
* Many packages are installed by the configuration:
  * most within the ZINIT directory
  * some exceptions using brew or apt
* Parts of the configuration are enabled by setting Feature Flags

## Requirements

### MacOs

* [homebrew](https://brew.sh/)
* tree

### Ubuntu

#### Linux

This configuration requires the following packages installed via package manager:
* zsh
* make
* gcc
* tree

#### Windows (WSL)

This configuration requires the following packages installed via package manager:
* zsh
* make
* gcc
* tree
* [Git.Git](https://winget.run/pkg/Git/Git) (in the Windows host)

## GIT Configuration

The setup of these is beyond the scope of this documentation and can be replaced by other mechanisms.

### MacOS

I prefer using [1Password CLI](https://1password.com/downloads/command-line) and [GitHub CLI](https://cli.github.com/) to clone/sync the repository.

### Windows (WSL)

GIT must be already configured in the Windows host and able to connect and clone this GitHub repo.
This [article](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git) can be consulted for details.

Run the following commands in the shell being installed:
```sh
git config --global credential.helper '/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe'
```

If this deployment is used to push code to the repository, these are required as well:
```sh
git config --global user.email "<REPLACE WITH EMAIL>"
git config --global user.name "<REPLACE WITH NAME>"
```

## Installation

Clone the repository:
```sh
git clone <this-repo> ~/.config/zsh
```

Enable the configuration:
```sh
ln -s ~/.config/zsh/.zshenv ~/.zshenv
```

## Feature Flags

### How to use

Feature flags are read from `${ZDOTDIR}/.featureflags` in the form of files that can be either empty (representing a `FLAG` or a default value for `VAR`) or contain some configuration parameter (representing a `VAR`). A feature flag with no file in this directory is interpreted as an `OFF` value for a `FLAG` or as `DEFAULT` for a `VAR`.

### Examples

#### Feature flag of type `VAR`

Selecting the default prompt:
```sh
echo -n "p10k" > ${ZDOTDIR}/.featureflags/DEFAULT_PROMPT
```

#### Feature flag of type `FLAG`

Enabling `pyenv`:
```sh
touch ~/.config/zsh/.featureflags/PYTHON
```

Keep in mind this will not install a Python interpreter (See [the Python section](Python) for instructions)

### Inventory

| Key/Filename | Type | Files | Purpose | Default | Values | Case Sensitivity |
| -- | -- | -- | -- | -- | -- | -- |
| `DEFAULT_PROMPT` | VAR | <nobr>[89-prompt](zshrc.d/89-prompt.zsh)</nobr> | Select the default prompt to install/use | `P10K` | `<EMPTY>`<br/>`P10K`<br/>`STARSHIP`<br/>`DEFAULT` | NO |
| `PYTHON` | FLAG/VAR | <nobr>[20-apps-05-python](zshrc.d/20-apps-05-python.zsh)</nobr> | Enable installation of `python` via `asdf` and, if available, initialize `conda` | OFF | `<EMPTY>`<br/><nobr>`<distro-name>`<nobr/> | N/A |
| `TMUX` | FLAG | <nobr>[03-tmux.zsh](zshrc.d/03-tmux.zsh)<nobr/> | Installs custom Oh-My-TMUX config | OFF | `<EMPTY>` | N/A |

## Python

Once `python` has been enabled in `asdf` (See [Feature Flags](#Feature-Flags) for instructions), you can install a Python interpreter by setting the distro name in the `PYTHON` feature flag (recommended: `miniforge3-latest`).
```sh
echo -n "miniforge3-latest" > ${ZDOTDIR}/.featureflags/PYTHON
```

Open a new terminal.
The specified distro will be registered as the global Python interpreter (with `system` as fallback).
If the Python interpreter is `conda` based, the hooks will be installed, enabling environment activations.
