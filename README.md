[![License: MIT](https://cdn.prod.website-files.com/5e0f1144930a8bc8aace526c/65dd9eb5aaca434fac4f1c34_License-MIT-blue.svg)](/LICENSE)

# My Home Manager config

## Installation

1. Install nix package manager
2. Get this repo with
```bash
git clone git@github.com:asoderlind/home-manager.git ~/.config/
```
4. Run home-manager in an interactive shell with
```bash
nix-shell -p home-manager
```
3. Activate the setup
```bash
home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake ~/.config/home-manager#axel@mac-home
```
The bit after the # depends on the environment of the computer. Depending on if there are old files left in .config, it might give errors that files will be overwritten. In that case, rename them and run the command again.

## 
