import std/[strutils, sequtils, osproc, sugar, strformat]
import std/options as opt
import ../../types
import nimblepkg/[options, packageparser]

type SearchResult* = object
  url*: string
  name*: string

proc parseUrlLine(line: string): string =
  ## Parses repository URLs such as "https://github.com/can-lehmann/owlkettle (git)"
  let keyValuePair: seq[string] = line.split(":", maxSplit = 1)
  let value = keyValuePair[1].strip()
  result = value.split(" ")[0]
  
proc execSearch(query: string): string =
  let processOutput = execCmdEx(fmt"nimble search {query}")
  assert processOutput.exitCode == 0, fmt"Nimble search failed with exitCode '{processOutput.exitCode}'"

  result = processOutput.output

proc parseSearchResultStr(searchResultStr: string): SearchResult =
  let searchLines = searchResultStr.split("\n")
  
  var projectName = searchLines[0]
  projectName.removeSuffix(':')

  let projectUrl = searchLines[1].parseUrlLine()
  return SearchResult(name: projectName, url: projectUrl)

proc searchPackage*(query: string): seq[SearchResult] =
  let fullSearchResultStr: string = execSearch(query)
  let searchResultStrs: seq[string] = fullSearchResultStr
    .split("\n \n")
    .filterIt(it != "")

  result = searchResultStrs.mapIt(it.parseSearchResultStr())

proc generateDummyOptions(): Options =
  result = initOptions()
  result.setNimBin()
  result.setNimbleDir()

proc parseNimbleFile*(nimblePath: string): ProjectInfo =
  let options = generateDummyOptions()

  result = getPkgInfoFromFile(nimblePath.NimbleFile, options)