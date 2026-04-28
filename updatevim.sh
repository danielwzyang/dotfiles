#!/bin/bash

cd /tmp
git clone --depth 1 https://github.com/vim/vim.git
cd vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-luainterp=yes \
            --enable-rubyinterp=yes \
            --enable-cscope \
            --prefix=/usr/local

make -j$(nproc)
sudo make install

cd /tmp
rm -rf /tmp/vim

vim --version | head -n 3
