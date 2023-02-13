import ./nimble_repository
import ./nimblest_repository
import ./git_repository
import ../../types
import std/[sugar, options]

proc find[T](sequence: seq[T], condition: proc(item: T): bool): Option[T] =
  for item in sequence:
    if item.condition():
      result = some(item)
  
  result = none(T)

proc getLatestVersion*(projectName: string): Option[Version] =
  let results: seq[SearchResult] = searchPackage(projectName)
  
  let project: Option[SearchResult] = results.find((item: SearchResult) => item.name == projectName)

  result = project.map(res => res.url.fetchLatestVersion())
