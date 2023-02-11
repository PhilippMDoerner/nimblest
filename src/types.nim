import nimblepkg/[packageinfotypes]

type ProjectInfo* = packageinfotypes.PackageInfo

type NimblestData* = ref object
  version*: string
  nimbleFiles*: seq[string]
  projects*: ref seq[ProjectInfo]
