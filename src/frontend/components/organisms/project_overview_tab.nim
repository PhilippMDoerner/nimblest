import pkg/owlkettle
import std/[strutils, strformat, options, sequtils]
import ../../../types
import pkg/owlling

viewable ProjectOverview:
  project: ProjectInfo

proc toKeyValuePair(obj: PkgTuple): KeyValuePair =
  result = (obj.name, $obj.ver)

proc toKeyValuePairs(list: seq[PkgTuple]): seq[KeyValuePair] =
  for entry in list:
    result.add entry.toKeyValuePair()

proc toP(text: string, weight: FontWeight = FontWeight.normal): Widget =
  Widget gui P(text = text, fontWeight = weight)

func toProjectTableColumns(project: ProjectInfo): seq[seq[Widget]] =
  let metaDataNames: seq[Widget] = @[
    "Version",
    "Author",
    "License"
  ].mapIt(it.toP(FontWeight.bold))

  let metaDataValues: seq[Widget] = @[
    ($project.version()).toP(),
    project.author().toP(),
    project.license().toP()
  ]

  result = @[metaDataNames, metaDataValues]

func toDependencyTableColumns(dependencies: seq[PkgTuple]): seq[seq[Widget]] =
  let packageNames = dependencies.mapIt(it.name.toP())
  let packageVersions = dependencies.mapIt(toP($it.ver))

  result = @[packageNames, packageVersions]

method view*(state: ProjectOverviewState): Widget =
  let projectInfoColumns: seq[seq[Widget]] = state.project.toProjectTableColumns()
  let dependencyTableColumns: seq[seq[Widget]] = state.project.dependencies().toDependencyTableColumns()

  gui:
    Box() {.hAlign: AlignCenter, vAlign: AlignStart.}:
      # settings
      orient = OrientY
      spacing = 50
      margin = Margin(left: 10, right: 10)

      #children
      Box() {.expand: false, vAlign: AlignStart.}:
        #settings
        orient = OrientY

        #children
        H1(text = state.project.name(), fontWeight = bold, hAlign = FontAlignment.faCenter)
        H3(text = state.project.description(), hAlign = FontAlignment.faCenter)

      Box() {.expand: false, hAlign: AlignCenter, vAlign: AlignStart.}:
        Table():
          columns = projectInfoColumns
          hSpacing = 100


      Box(orient = OrientY) {.expand: false, hAlign: AlignCenter, vAlign: AlignStart.}:
        H2(text = "Dependencies", fontWeight = FontWeight.bold, hAlign = faCenter)
        Table():
          hSpacing = 100
          headings = some @[
            "Package".toP(fontWeight = FontWeight.bold),
            "Version".toP(fontWeight = FontWeight.bold)
          ]
          columns = dependencyTableColumns

export ProjectOverview