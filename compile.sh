#!/bin/sh
clear
rm -rf obj
ndk-build NDK_PROJECT_PATH=./ $@ -j8
