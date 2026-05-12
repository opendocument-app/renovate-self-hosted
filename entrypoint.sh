#!/bin/sh

set -e

which conan || true
conan --version || true

install-apt pipx
pipx ensurepath
pipx install conan

git clone https://github.com/opendocument-app/conan-odr-index.git
python conan-odr-index/scripts/conan_export_all_packages.py

exec runuser -u ubuntu renovate
