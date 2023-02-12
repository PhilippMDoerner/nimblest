import pkg/owlkettle
import ../atoms/h1
import ../../../types

viewable ProjectOverview:
  project: ProjectInfo

method view*(state: ProjectOverviewState): Widget =
  gui:
    H1(text = state.project.basicInfo.name, fontWeight = FontWeight.bold)

export ProjectOverview