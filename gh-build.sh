#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

deps=$(sed -e '/^#.*$/d; /^$/d; /^\s*$/d' package/dependencies | paste -sd ,)

printf >configuration "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://kaytime.github.io" \
	"Package: system-core-minimal" \
	"Version: $PROJECT_VERSION" \
	"Maintainer: Stephane Tsana <stephanetse@gmail.com>" \
	"Depends: $deps" \
	"Architecture: all" \
	"Description: System core minimal metapackage for Kaytime."

equivs-build configuration
