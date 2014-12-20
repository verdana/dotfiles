#!/bin/sh

# 备份现有的 pure.zsh
[ -f "pure.zsh" ] && ( mv pure.zsh pure.zsh.bak )

# 下载 pure.zsh
wget -q https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh

# 修改 Prompt 中空格的位置
sed -i "s/❯%f /❯ %f/" pure.zsh

