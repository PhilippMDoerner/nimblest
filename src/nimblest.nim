import pkg/owlkettle
import ./frontend/pages
import ./frontend/components/molecules/[sidebar, nimble_import_button, burger_menu]
import ./types
import ./backend/nimblest_repository

viewable App:
  nimblestData: NimblestData = loadNimblestFile()
  page: PageType

method view(state: AppState): Widget =
  gui:
    Window:
      title = "nimblest"
      HeaderBar {.addTitlebar.}:
        NimbleImportButton() {.addLeft.}
        BurgerMenu() {.addRight.}

      Paned:
        initialPosition = 200
        Sidebar(projects = state.nimblestData.projects)
        Box():
          discard

when isMainModule:
  brew(gui(App()))