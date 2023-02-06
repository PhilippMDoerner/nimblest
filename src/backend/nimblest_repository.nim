import std/os
import pkg/jsony
import ../types

const DEFAULT_NIMBLEST_FILEPATH =
  when defined(release):
    "~/.nimblest.json"
  else:
    ".dummy_nimblest.json" # TODO: Improve this to be some default config file path

proc writeNimblestFile*(data: NimblestData) = 
  writeFile(DEFAULT_NIMBLEST_FILEPATH, data.toJson())

proc loadNimblestFile*(): NimblestData =
  if DEFAULT_NIMBLEST_FILEPATH.fileExists():
    let nimblestData = readFile(DEFAULT_NIMBLEST_FILEPATH)
    return nimblestData.fromJson(NimblestData)

  else:
    let defaultData = new(NimblestData)
    writeNimblestFile(defaultData)
    return defaultData
