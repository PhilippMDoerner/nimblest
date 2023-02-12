import nimblepkg/[packageinfotypes, version]
import std/strformat

export version.`$`
export version.PkgTuple
type ProjectInfo* = packageinfotypes.PackageInfo

type NimblestData* = ref object
  version*: string
  nimbleFiles*: seq[string]
  projects*: ref seq[ProjectInfo]
