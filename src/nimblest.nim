import owlkettle
import ./pages
import ./types
import ./components/molecules/[sidebar, nimble_import_button, burger_menu]

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