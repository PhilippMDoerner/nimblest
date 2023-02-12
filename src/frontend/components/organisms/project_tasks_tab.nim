import pkg/owlkettle
import ../atoms/h1
import ../../../types

viewable ProjectTasks:
  project: ProjectInfo

method view*(state: ProjectTasksState): Widget =
  gui:
    H1(text="ProjectTasks", fontWeight = FontWeight.bold)

export ProjectTasks