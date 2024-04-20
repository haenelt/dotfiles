# dotfiles

You will need `git` and GNU `stow`. Clone this repository into your `$HOME` directory

```
git clone https://github.com/haenelt/dotfiles.git ~/.dotfiles
```

Run `stow` to symlink everything

```
stow --dir .dotfiles --target $HOME .
```

