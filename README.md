## Dotfiles

我的 Arch Linux 配置文件。
大部分时候，这些配置文件也适用于其它 Linux 系统以及 BSD/Mac/Cygwin 等环境。

## 安装

```sh
git clone https://github.com/verdana/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
make
```

make 将会自动创建符号链接到 HOME 目录，如果对应的文件已经存在，会自动忽略，并给出警告信息，方便手动处理。

make clean 会删除对应文件的符号链接。

详细的过程请查看 Makefile。


## Vim Bundles

.vim/bundle/ 目录下是 VBundle 管理的 Vim 插件，这些插件也同时注册为 git submodule。

第一次克隆仓库时，可以加上 --recursive 参数同时下载这些模块。

```sh
git clone --recursive https://github.com/verdana/dotfiles.git $HOME/.dotfiles
```

