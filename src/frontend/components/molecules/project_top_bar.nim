import std/sequtils
import pkg/owlkettle
import ../../icons
import ../../../types
import ../atoms/text

type ViewState = enum
  SearchState
  DisplayProjectState

viewable ProjectTopBar:
  projects: ref seq[ProjectInfo]
  activeProjectIndex: ref int
  viewState: ViewState = ViewState.DisplayProjectState

method view*(state: ProjectTopBarState): Widget =
  var projectItems: seq[string] = @[]
  for project in state.projects[]:
    projectItems.add project.basicInfo.name

  gui:
    Box(spacing = 6) {.expand: true, resize: true.}: 
      sensitive = true
      margin = Margin(top: 0, bottom: 0, left: 50, right: 50)
      
      DropDown() {.expand: true.}:
        tooltip = "Project"
        sensitive = true
        sizeRequest = (500, -1)
        items = projectItems
        selected = state.activeProjectIndex[]
        enableSearch = true
        proc select(item: int) =
          state.activeProjectIndex[] = item
          state.app.redraw()

export ProjectTopBar