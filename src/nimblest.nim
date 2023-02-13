import pkg/owlkettle
import ./frontend/components/molecules/[
  nimble_import_button, 
  project_top_bar, 
  #burger_menu,
  #nim_info_button, 
  #package_button
]
import ./frontend/page
import ./types
import ./backend

{.warning[User]:off.}
{.warning[LockLevel]:off.}

viewable App:
  nimblestData: NimblestData = loadInitialNimblestData()
  selectedProjectIndex: ref int = new(int)
  page: PageType

method view(state: AppState): Widget =
  let activeProject = state.nimblestData.projects[state.selectedProjectIndex[]]
  gui:
    Window:
      HeaderBar {.addTitlebar.}:
        # Left (Left-most first)
        NimbleImportButton() {.addLeft.}

        # Right (Right-most first)
        # BurgerMenu() {.addRight.}
        #NimInfoButton() {.addRight.} # TODO: Implement
        #PackageButton() {.addRight.} # TODO: Implement
        ProjectTopBar() {.addRight.}:
          activeProjectIndex = state.selectedProjectIndex
          projects = state.nimblestData.projects

      Page():
        project = activeProject

when isMainModule:
  brew(gui(App()))