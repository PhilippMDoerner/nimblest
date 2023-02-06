import std/strutils

type SemVer = array[3, int]
proc `$`*(versionNumbers: SemVer): string = versionNumbers.join(".")

type Package* = object
  version*: Semver

type Project* = object
  name*: string
  dependencies*: seq[Package]

type NimbleIniData* = object

type NimblestData* = ref object
  projects*: seq[Project]