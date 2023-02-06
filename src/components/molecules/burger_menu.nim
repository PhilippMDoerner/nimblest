import owlkettle
import ../../icons

viewable BurgerMenu:
  discard

## TODO: Add Options: "About", "Preferences"
method view*(state: BurgerMenuState): Widget =
  gui:
    MenuButton:
      icon = IconName.inBurgerMenu
      Popover:
        Box(orient = OrientY, spacing = 6, margin = 6):
          ModelButton:
            text = "About"

          ModelButton:
            text = "Preferences"

export BurgerMenu