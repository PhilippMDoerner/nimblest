# Package

version       = "0.1.0"
author        = "Philipp Doerner"
description   = "A GTK4 based GUI for nimble. Written with pkg/owlkettle"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["nimblest"]


# Dependencies

requires "nim >= 1.6.10"
requires "https://github.com/can-lehmann/owlkettle#head"
requires "jsony >= 1.1.4"
requires "nimble >= 0.14.2"
requires "compiler"
requires "https://github.com/PhilippMDoerner/owlling#head"

# External Dependencies
# Git
# Nimble
# OpenSSL through nimble

task play, "run example":
  --outdir:"."
  # --panics:on # Bricks owlkettle for now
  --define:ssl
  --run
  --styleCheck:usages
  --spellSuggest:50
  --path:"/home/philipp/dev/owlling"
  --mm:refc
  setCommand "c", "src/nimblest.nim"

task dev, "compile and run dev build":
  exec "nim r -d:ssl --mm:refc --panics:on src/nimblest.nim"

task release, "Compile a release build binary":
  --outdir:"."
  --panics:on
  --define:release
  --define:lto
  --run
  --mm:orc
  setCommand "c", "src/nimblest.nim"

task reOwl, "Reinstall owlling":
  exec "rm -r ~/.nimble/pkgs2/owlling-0.1.0-*"
  exec "nimble play"