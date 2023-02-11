import nimblepkg/[options, packageparser, packageinfotypes, sha1Hashes, paths]

type ProjectInfo* = packageinfotypes.PackageInfo

type NimblestData* = ref object
  version*: string
  nimbleFiles*: seq[string]
  projects*: seq[ProjectInfo]
