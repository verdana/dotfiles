## Dotfiles

我的 Arch Linux 配置文件。
大部分时候，这些配置文件也适用于其它的 Linux / Mac / Cygwin 环境中。

## 安装

```sh
git clone https://github.com/verdana/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
make
```

make 将会自动创建符号链接到 HOME 目录，如果对应的文件已经存在，会自动
忽略，并给出警告信息，方便手动处理。

make clean 会删除所有创建的符号链接（包括您自己的文件）。

详细的过程请查看 Makefile


