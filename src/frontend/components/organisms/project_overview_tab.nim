import pkg/owlkettle
import std/[strutils, strformat, options]
import ../atoms/text
import ../molecules/keyvaluelist
import ../../../types

viewable ProjectOverview:
  project: ProjectInfo

proc toKeyValuePair(obj: PkgTuple): KeyValuePair =
  result = (obj.name, $obj.ver)

proc toKeyValuePairs(list: seq[PkgTuple]): seq[KeyValuePair] =
  for entry in list:
    result.add entry.toKeyValuePair()

method view*(state: ProjectOverviewState): Widget =
  let metaDataItems: seq[KeyValuePair] = @[
    ("Version: ", $state.project.version()),
    ("Author: ", state.project.author()),
    ("License: ", state.project.license())
  ]
  let dependencies: seq[PkgTuple] = state.project.dependencies()
  let dependencyItems: seq[KeyValuePair] = dependencies.toKeyValuePairs()

  gui:
    Box(orient = OrientY, spacing = 50) {.hAlign: AlignCenter, vAlign: AlignStart.}:
      Box(orient = OrientY) {.expand: false, vAlign: AlignStart.}:
        H1(text = state.project.name(), fontWeight = bold)
        H3(text = state.project.description())
        
      Box() {.expand: false, hAlign: AlignCenter, vAlign: AlignStart.}:
        KeyValueDisplayList(items = metaDataItems)
      
      Box(orient = OrientY) {.expand: false, hAlign: AlignCenter, vAlign: AlignStart.}:
        H2(text = "Dependencies", fontWeight = bold)
        KeyValueDisplayList(items = dependencyItems, spacing = 30):
          heading = some(("Package", "Version"))

export ProjectOverview