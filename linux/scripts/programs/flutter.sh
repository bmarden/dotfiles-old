#!/bin/bash

# Download flutter 
cd $HOME/Downloads && curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.12.13+hotfix.8-stable.tar.xz

cd $HOME
mkdir development
cd development
tar xf ~/Downloads/flutter_linux_v1.12.13+hotfix.8-stable.tar.xz


