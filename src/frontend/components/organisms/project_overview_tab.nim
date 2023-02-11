import pkg/owlkettle

viewable ProjectOverview:
  discard

method view*(state: ProjectOverviewState): Widget =
  gui:
    Label(text="ProjectOverview")

export ProjectOverview