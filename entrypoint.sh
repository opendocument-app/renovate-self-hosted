#!/bin/sh

set -e

install-apt python3 pipx
pipx ensurepath
pipx install conan

git clone https://github.com/opendocument-app/conan-odr-index.git
python3 conan-odr-index/scripts/conan_export_all_packages.py

exec runuser -u ubuntu renovate
