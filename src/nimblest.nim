import pkg/owlkettle
import ./frontend/pages
import ./frontend/components/molecules/[
  sidebar, 
  nimble_import_button, 
  project_top_bar, 
  nim_info_button, 
  burger_menu,
  package_button
]
import ./types
import ./backend/nimblest_repository

{.warning[User]:off.}
{.warning[LockLevel]:off.}

viewable App:
  nimblestData: NimblestData = loadInitialNimblestData()
  page: PageType

method view(state: AppState): Widget =
  let projects = state.nimblestData.projects
  gui:
    Window:
      HeaderBar {.addTitlebar.}:
        # Left (Left-most first)
        NimbleImportButton() {.addLeft.}

        # Right (Right-most first)
        BurgerMenu() {.addRight.}
        NimInfoButton() {.addRight.}
        PackageButton() {.addRight.}
        ProjectTopBar(projects = state.nimblestData.projects) {.addRight.}

      Box():
        discard

when isMainModule:
  brew(gui(App()))