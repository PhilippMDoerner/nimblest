# Package

version       = "0.1.0"
author        = "Philipp Doerner"
description   = "A GTK4 based GUI for nimble. Written with owlkettle"
license       = "GPL-3.0-or-later"
srcDir        = "src"
bin           = @["nimblest"]


# Dependencies

requires "nim >= 1.6.10"
requires "owlkettle >= 2.1.0"


task play, "run example":
  --outdir:"."
  --run
  setCommand "c", "src/nimblest.nim"
