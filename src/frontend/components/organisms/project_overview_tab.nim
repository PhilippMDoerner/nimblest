import pkg/owlkettle
import std/[strutils, strformat, options]
import ../atoms/[p, h1, h2, h3]
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
    ("Version: ", $state.project.basicInfo.version),
    ("Author: ", state.project.author),
    ("License: ", state.project.license)
  ]

  let dependencies: seq[PkgTuple] = state.project.requires
  let dependencyItems: seq[KeyValuePair] = dependencies.toKeyValuePairs()
  gui:
    Box(orient = OrientY) {.hAlign: AlignCenter.}:
      Box(orient = OrientY, margin = Margin(bottom: 30)):
        H1(text = state.project.basicInfo.name, fontWeight = h1.bold) {.expand: false.}: discard
        H3(text = state.project.description)
        
      Box(margin = Margin(bottom: 30)) {.hAlign: AlignCenter.}:
        KeyValueDisplayList(items = metaDataItems)
      
      Box(orient = OrientY) {.hAlign: AlignCenter.}:
        H2(text = "Dependencies", fontWeight = h2.bold, margin = Margin(bottom: 40))
        KeyValueDisplayList(items = dependencyItems, boxSpace = 30):
          heading = some(("Package", "Version"))

export ProjectOverview