import nimblepkg/[packageinfotypes, version, options]
import std/[strformat, tables]
import std/options as opt

export version.`$`
export version.PkgTuple
export version.Version
export version.newVersion

type ProjectInfo* = ref object
  info*: PackageInfo
  dependencyVersions*: Option[Table[string, Version]]

proc newProjectInfo*(info: PackageInfo): ProjectInfo = 
  ProjectInfo(info: info, dependencyVersions: none(Table[string, Version]))

proc name*(obj: ProjectInfo): string = obj.info.basicInfo.name
proc version*(obj: ProjectInfo): Version = obj.info.basicInfo.version
proc author*(obj: ProjectInfo): string = obj.info.author
proc license*(obj: ProjectInfo): string = obj.info.license
proc dependencies*(obj: ProjectInfo): seq[PkgTuple] = obj.info.requires
proc description*(obj: ProjectInfo): string = obj.info.description

type KeyValuePair* = tuple[key: string, value: string]

type NimblestData* = ref object
  version*: string
  nimbleFiles*: seq[string]
  projects*: ref seq[ProjectInfo]
