#!/bin/sh

# 手动设置 dpi 显示而不是采用磨人的 96
echo 'Xft.dpi: 102' | xrdb -merge
