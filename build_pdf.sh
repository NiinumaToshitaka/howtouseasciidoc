#!/bin/sh

# HEADのコミットのハッシュ値
head_commit_hash=`git rev-parse --short HEAD`
# HEADのコミットの日時
head_commit_date=`git log -1 --format='%cI' "${head_commit_hash}"`

# PDF形式に変換する。
asciidoctor-pdf -r asciidoctor-diagram -r ./config.rb --trace --verbose asciidoc_install_manual.adoc  -acommit-hash="${head_commit_hash}" -acommit-date="${head_commit_date}"
