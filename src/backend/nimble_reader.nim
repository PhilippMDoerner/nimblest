import nimblepkg/[options, packageparser]
import ../types

proc generateDummyOptions(): Options =
  result = initOptions()
  result.setNimBin()
  result.setNimbleDir()

proc parseNimbleFile*(nimblePath: string): ProjectInfo =
  let options = generateDummyOptions()

  result = getPkgInfoFromFile(nimblePath.NimbleFile, options)