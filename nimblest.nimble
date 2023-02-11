# Package

version       = "0.1.0"
author        = "Philipp Doerner"
description   = "A GTK4 based GUI for nimble. Written with pkg/owlkettle"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["nimblest"]


# Dependencies

requires "nim >= 1.6.10"
requires "https://github.com/can-lehmann/owlkettle@#head"
requires "jsony >= 1.1.4"


task play, "run example":
  --outdir:"."
  --panics:on
  --run
  --styleCheck:usages
  --spellSuggest:50
  --mm:refc
  setCommand "c", "src/nimblest.nim"

task release, "Compile a release build binary":
  --outdir:"."
  --panics:on
  --define:release
  --define:lto
  --run
  --mm:orc
  setCommand "c", "src/nimblest.nim"