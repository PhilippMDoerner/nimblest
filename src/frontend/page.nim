import pkg/owlkettle
import ./components/organisms/[project_overview_tab, project_tasks_tab]
import ./icons
import ../types

type PageType* = enum
  ptOverview
  ptTasks

viewable Page:
  project: ProjectInfo
  kind: PageType = PageType.ptOverview

proc togglePage(currentPage: var PageType) =
  currentPage = case currentPage:
    of PageType.ptOverview: PageType.ptTasks
    of PageType.ptTasks: PageType.ptOverview



method view*(state: PageState): Widget =
  gui:
    Box(spacing = 6, orient = OrientY) {.expand:false.}:
      Box(spacing = 6, margin = 12, orient = OrientX) {.expand: false.}:
        style = {BoxStyle.BoxCard}
        Box()
        Button {.expand: false.}:
          style = {ButtonSuggested}
          icon = case state.kind:
            of PageType.ptOverview: IconName.inList
            of PageType.ptTasks: IconName.inOverview

          proc clicked() = state.kind.togglePage()


      case state.kind:
      of PageType.ptOverview:
        ProjectOverview():
          project = state.project
      of PageType.ptTasks:
        ProjectTasks():
          project = state.project

export Page