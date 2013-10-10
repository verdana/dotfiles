## Dotfiles

我的 Arch Linux 配置文件。
大部分时候，这些配置文件也适用于其它 Linux 系统以及 BSD/Mac/Cygwin 等环境。

## Install

```sh
git clone https://github.com/verdana/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
make
```

make 将会自动创建符号链接到当前用户的主目录，如果对应的文件已经存在，会自动忽略，并给出警告信息，方便手动处理。

make clean 会删除对应文件的符号链接。

详细的过程请查看 Makefile。

