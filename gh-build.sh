#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)
git_commit=$(git rev-parse --short HEAD)

printf >configuration "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://kaytime.github.io" \
	"Package: system-core-minimal" \
	"Version: $git_commit" \
	"Maintainer: Stephane Tsana <stephanetse@gmail.com>" \
	"Depends: $deps" \
	"Architecture: all" \
	"Description: System core minimal metapackage for Kaytime."

equivs-build configuration
