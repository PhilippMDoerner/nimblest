import pkg/owlkettle
import std/[strutils, strformat, options]
import owlling
import ../../../types

viewable DependencyList:
  dependencies: seq[PkgTuple]
  dependencyVersions: Option[PkgVersions]


method view*(state: ProjectOverviewState): Widget =
  gui:
    Box(orient = OrientY, spacing = 50) {.hAlign: AlignCenter, vAlign: AlignStart.}:
      Box(orient = OrientY) {.expand: false, hAlign: AlignCenter, vAlign: AlignStart.}:
        H2(text = "Dependencies", fontWeight = bold)
        KeyValueDisplayList(items = dependencyItems, spacing = 30):
          heading = some(("Package", "Version"))

export ProjectOverview