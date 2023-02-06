import pkg/owlkettle
import ./frontend/pages
import ./frontend/components/molecules/[sidebar, nimble_import_button, burger_menu]
import ./types

proc loadSavedData(): seq[Project] =
  result = @[Project(name: "Potato")]

viewable App:
  page: PageType
  projects: seq[Project] = loadSavedData()

method view(state: AppState): Widget =
  gui:
    Window:
      title = "nimblest"
      HeaderBar {.addTitlebar.}:
        NimbleImportButton() {.addLeft.}
        BurgerMenu() {.addRight.}

      Paned:
        initialPosition = 200
        Sidebar(projects = state.projects)
        Box():
          discard

when isMainModule:
  brew(gui(App()))