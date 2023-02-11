import pkg/owlkettle

viewable ProjectTasks:
  discard

method view*(state: ProjectTasksState): Widget =
  gui:
    Label(text="ProjectTasks")

export ProjectTasks