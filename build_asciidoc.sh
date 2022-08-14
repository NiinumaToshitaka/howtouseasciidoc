#!/bin/bash

# AsciiDocファイルをビルドする。

# ビルド対象のAsciiDocファイル
target_file=asciidoc_install_manual.adoc
# ビルド後のファイルを格納するディレクトリ
readonly destination=output/
# 変換後のAsciiDocファイルに情報を埋め込む対象のコミット
readonly target_commit=HEAD
# コミットのハッシュ値
commit_hash=$(git rev-parse --short ${target_commit})
# コミットの日時
commit_date=$(git log -1 --format='%cI' ${target_commit})

# HTML形式に変換する。
asciidoctor \
    -r asciidoctor-kroki \
    --trace --verbose \
    -acommit-hash="${commit_hash}" \
    -acommit-date="${commit_date}" \
    -aallow-uri-read \
    "${target_file}"

# PDF形式に変換する。
asciidoctor-pdf \
    -r asciidoctor-kroki \
    -r ./config.rb \
    --trace --verbose \
    -acommit-hash="${commit_hash}" \
    -acommit-date="${commit_date}" \
    -aallow-uri-read \
    "${target_file}"


# ビルドした成果物を移動
mv ./*.html ./*.pdf "${destination}"
