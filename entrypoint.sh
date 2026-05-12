#!/bin/sh

set -e

install-apt python3 pipx

runuser -u ubuntu pipx ensurepath
runuser -u ubuntu pipx install conan

runuser -u ubuntu git clone https://github.com/opendocument-app/conan-odr-index.git /tmp/conan-odr-index
runuser -u ubuntu python3 /tmp/conan-odr-index/scripts/conan_export_all_packages.py

exec runuser -u ubuntu renovate
