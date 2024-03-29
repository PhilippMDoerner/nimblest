import std/[os, sequtils]
import pkg/jsony
import ./nimble_repository
import ../../types

const DEFAULT_NIMBLEST_FILEPATH =
  when defined(release):
    "~/.nimblest.json"
  else:
    ".dummy_nimblest.json" # TODO: Improve this to be some default config file path

type StoredNimblestData* = object
  version*: string
  projectNimbles*: seq[string]

proc writeToDisk*(data: StoredNimblestData) =
  writeFile(DEFAULT_NIMBLEST_FILEPATH, data.toJson())

proc writeToDisk*(data: NimblestData) =
  let storableData = StoredNimblestData(
    version: data.version,
    projectNimbles: data.nimbleFiles
  )

  storableData.writeToDisk()

proc readNimblestDataFromDisk*(): StoredNimblestData =
  if DEFAULT_NIMBLEST_FILEPATH.fileExists():
    let storedDataStr: string = readFile(DEFAULT_NIMBLEST_FILEPATH)
    return storedDataStr.fromJson(StoredNimblestData)

  else:
    let defaultData = StoredNimblestData()
    defaultData.writeToDisk()
    return defaultData
