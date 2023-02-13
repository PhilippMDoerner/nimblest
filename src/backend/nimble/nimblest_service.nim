import ./nimble_repository
import ./nimblest_repository
import ../../types
import std/sequtils

proc loadInitialNimblestData*(): NimblestData =
  let storedData: StoredNimblestData = readNimblestDataFromDisk()

  var projects: ref seq[ProjectInfo] = new(seq[ProjectInfo])
  projects[] = storedData.projectNimbles.mapIt(it.parseNimbleFile())

  result = NimblestData(
    version: storedData.version,
    nimbleFiles: storedData.projectNimbles,
    projects: projects
  )