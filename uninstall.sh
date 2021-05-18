#!/usr/bin/env bash

installPrefix=$HOME/.local

rm $installPrefix/bin/golemsp
rm $installPrefix/bin/ya-provider
rm $installPrefix/bin/yagna
rm $installPrefix/bin/gftp

rm $installPrefix/bin/libgftp.rlib
rm $installPrefix/bin/libya_exe_unit.rlib
rm $installPrefix/bin/libya_provider.rlib

rm -r $installPrefix/lib/yagna