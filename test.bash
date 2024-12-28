#!/bin/bash
# SPDX-FileCopyrightText: 2024 suzuki takuma <s23c1076vc@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

out=$(seq 5 | ./plus_stdin)
[ "${out}" = 15 ] || ng "$LINENO"

### 変な時###
out=$(echo あ | ./plus_stdin)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || "$LINENO"

out=$(echo | ./plus_stdin)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
