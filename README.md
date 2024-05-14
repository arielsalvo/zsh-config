# Ariel's ZShell configuration

## Intro and Basics

* Based on ZShell:ZI
* This repository should be cloned to `$HOME/.config/zsh` (a.k.a. `$ZDOTDIR`)
* To enable the configuration, symlink `$ZDOTDIR/.zshenv` to `$HOME/.zshenv`
* $ZDOTDIR is implied from the real location of `.zshenv` (changing it is untested)
* The rest of the configuration is self-deployed during the first run

## Feature Flags

| Key/Filename | Files | Purpose | Default | Values | Case Sensitivity |
| -- | -- | -- | -- | -- | -- |
| `DEFAULT_PROMPT` | <nobr>[89-prompt](zshrc.d/89-prompt.zsh)</nobr> | Select the default prompt to install/use | `P10K` | `<EMPTY>`<br/>`P10K`<br/>`STARSHIP`<br/>`DEFAULT` | NO |
| `PYTHON` | <nobr>[20-apps-05-python](zshrc.d/20-apps-05-python.zsh)</nobr> | Enable installation of `pyenv` and, if available, initialize `conda` | OFF | `<EMPTY>` | N/A |