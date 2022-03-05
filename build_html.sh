#!/bin/sh

# HTML形式に変換する。
asciidoctor -r asciidoctor-diagram --trace asciidoc_install_manual.adoc
