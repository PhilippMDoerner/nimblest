# Directory-structure explanation
- backend:      Backend-Code. Each domain has its own sub-directory
  - nimble:       Nimble-Domain. Reads/Writes package-related data, of this package or dependencies
- frontend:     Frontend-Code
  - Components:   Reuseable- and Non-Resueable-Widgets for the frontend to be used in Pages
    - Atoms:        Tiny reuseable library components, 1-2 Widgets at most
    - Molecules:    Medium reuseable ibrary components, multiple Widgets and/or atoms
    - Organisms:    Large resueable library components, multiple molecules/atoms
    - Custom:       Components specific for this application
    - icons.nim:    List of used icons for this application
    - page.nim:     Central Widget controlling individual "Pages" of the application and routing
- backend.nim:  Unifies code from backend-nim into one "interface"
- nimblest.nim: Application-root. Contains central "Store" of application-data and defines window
- types.nim:    Interface types used by both Frontend and Backend

# Credo for widgets:
A widget is either:
- "dumb", no logic, only receives data and displays it, no data-fetching on its own, hands evens through
- "smart", no inputs, fetches its own data and is allowed to perform actions