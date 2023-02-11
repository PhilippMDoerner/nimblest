import pkg/owlkettle
import ../../icons

viewable NimInfoButton:
  discard

method view*(state: NimInfoButtonState): Widget =
  gui:
    MenuButton:
      icon = IconName.inInfo


export NimInfoButton