import pkg/owlkettle
import owlling
import ../../../types

viewable Sidebar:
  projects: seq[ProjectInfo]

method view*(state: SidebarState): Widget =
  gui:
    Paned {.resize: true.}:
      ScrolledWindow {.resize: true.}:
        ListBox:
          selectionMode = SelectionMode.SelectionBrowse

          for project in state.projects:
            P(text = project.basicInfo.name)

export Sidebar