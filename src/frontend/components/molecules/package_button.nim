import pkg/owlkettle
import ../../icons

viewable PackageButton:
  discard

method view*(state: PackageButtonState): Widget =
  gui:
    MenuButton:
      icon = IconName.inList


export PackageButton