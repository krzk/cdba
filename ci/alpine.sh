#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
#
# Copyright (c) 2019-2021 Petr Vorel <petr.vorel@gmail.com>
# Copyright (c) 2021 Canonical Ltd.
# Copyright (c) 2023 Linaro Ltd
# Author: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
#                             <krzk@kernel.org>
#

set -ex

apk update

PKGS_CC="gcc"
case $CC in
	clang*)
		# On Alpine v3.14 clang fails without gcc:
		# cannot find crtbeginS.o: No such file or directory
		PKGS_CC="clang gcc"
	;;
esac

apk add \
	libftdi1-dev \
	eudev \
	yaml-dev \
	make \
	pkgconfig \
	$PKGS_CC

echo "Install finished: $0"
