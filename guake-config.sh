#!/usr/bin/env bash

palette="#4e4e4e4e4e4e:#ffff6b6b6060:#ffffc3e10000:#ffffffffb6b6:#56569696eded:#ffff7373fdfd:#8e8ee4e47878:#eeeeeeeeeeee:#4f4f4f4f4f4f:#f9f968686060:#fafab0b03636:#fdfdffffb8b8:#6b6b9f9feded:#fcfc6e6ef9f9:#8e8ee4e47878:#ffffffffffff:#f8f8f8f8f2f2:#000000000000"
bd_color="#000000000000"
fg_color="#ffffffffffff"
bg_color="#1C1C1C1C1C1C"

gconftool-2 -s -t string /apps/guake/style/font/palette $palette
gconftool-2 -s -t string /apps/guake/style/font/bold $bd_color
gconftool-2 -s -t string /apps/guake/style/font/color $fg_color
