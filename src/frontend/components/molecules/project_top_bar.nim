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
  let activeProject = state.projects[state.activeProjectIndex]
  gui:
    Entry {.resize: true.}:
      width = 50
      text = activeProject.basicInfo.name


export ProjectTopBar