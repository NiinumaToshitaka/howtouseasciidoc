#!/bin/sh

# PDF形式に変換する。
asciidoctor-pdf -r asciidoctor-diagram -r ./config.rb --trace asciidoc_install_manual.adoc
