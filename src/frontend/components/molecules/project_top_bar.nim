import std/sequtils
import pkg/owlkettle
import ../../icons
import ../../../types

type ViewState = enum
  SearchState
  DisplayProjectState

viewable ProjectTopBar:
  projects: ref seq[ProjectInfo]
  activeProjectIndex: int = 0
  viewState: ViewState = ViewState.DisplayProjectState

method view*(state: ProjectTopBarState): Widget =
  var projectItems: seq[string] = @[]
  for project in state.projects[]:
    projectItems.add project.basicInfo.name

  gui:
    Box(spacing = 6) {.expand: true, resize: true.}: 
      sensitive = true           
      DropDown() {.expand: true.}:
        sensitive = true
        margin = Margin(top: 0, bottom: 0, left: 50, right: 50)
        sizeRequest = (500, -1)
        items = projectItems
        selected = state.activeProjectIndex
        enableSearch = true

export ProjectTopBar