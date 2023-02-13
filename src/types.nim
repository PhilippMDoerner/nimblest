import nimblepkg/[packageinfotypes, version, options]
import std/strformat

export version.`$`
export version.PkgTuple
export version.Version
export version.newVersion
type ProjectInfo* = packageinfotypes.PackageInfo

type NimblestData* = ref object
  version*: string
  nimbleFiles*: seq[string]
  projects*: ref seq[ProjectInfo]
