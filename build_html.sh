#!/bin/sh

# HEADのコミットのハッシュ値
head_commit_hash=`git rev-parse --short HEAD`
# HEADのコミットの日時
head_commit_date=`git log -1 --format='%cI' "${head_commit_hash}"`

# HTML形式に変換する。
# HEADのコミットのハッシュ値と日時を指定して，文書中で参照できるようにする
asciidoctor -r asciidoctor-diagram --trace asciidoc_install_manual.adoc -acommit-hash="${head_commit_hash}" -acommit-date="${head_commit_date}"
