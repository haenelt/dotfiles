# dotfiles

You will need `git` and GNU `stow`. Clone this repository into your `$HOME` directory

```
git clone https://github.com/haenelt/dotfiles.git ~/.dotfiles
```

Run `stow` to symlink everything

```
stow --dir .dotfiles --target $HOME .
```

With the following commands, no symlinks are created and all dotfiles are copied into the `$HOME` directory. The repository is then deleted.

```
rm -rf .dotfiles/.git
rm -rf .dotfiles/.gitignore
mv -r .dotfiles/.* $HOME
rm -rf .dotfiles
```
