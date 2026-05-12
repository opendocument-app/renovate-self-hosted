#!/bin/sh

set -e

install-apt python3-pip
pip3 install conan

git clone https://github.com/opendocument-app/conan-odr-index.git
python conan-odr-index/scripts/conan_export_all_packages.py

exec runuser -u ubuntu renovate
