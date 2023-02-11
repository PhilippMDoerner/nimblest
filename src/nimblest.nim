import pkg/owlkettle
import ./frontend/pages
import ./frontend/components/molecules/[
  nimble_import_button, 
  project_top_bar, 
  burger_menu,
  #nim_info_button, 
  #package_button
]
import ./types
import ./backend/nimblest_repository

{.warning[User]:off.}
{.warning[LockLevel]:off.}

viewable App:
  nimblestData: NimblestData = loadInitialNimblestData()
  page: PageType

method view(state: AppState): Widget =
  gui:
    Window:
      HeaderBar {.addTitlebar.}:
        # Left (Left-most first)
        NimbleImportButton() {.addLeft.}

        # Right (Right-most first)
        BurgerMenu() {.addRight.}
        #NimInfoButton() {.addRight.} # TODO: Implement
        #PackageButton() {.addRight.} # TODO: Implement
        ProjectTopBar() {.addRight.}:
          projects = state.nimblestData.projects

      Box()

when isMainModule:
  brew(gui(App()))