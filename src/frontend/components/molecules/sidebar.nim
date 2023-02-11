import pkg/owlkettle
import ../atoms/left_label
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
            LeftLabel():
              text = project.basicInfo.name

export Sidebar