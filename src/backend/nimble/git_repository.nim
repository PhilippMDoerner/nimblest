import std/[strutils, strformat, osproc]
import ../../types

proc fetchLatestVersion*(repoUrl: string): Version =
  let command = fmt"""
    git \
      -c 'versionsort.suffix=-' ls-remote \
      --exit-code \
      --refs \
      --sort='version:refname' \
      --tags {repoUrl} '*.*.*' \
      | tail --lines=1 \
      | cut --delimiter='/' --fields=3
  """
  let processOutput = execCmdEx(command)

  var tag = processOutput.output
  tag.removePrefix('v')

  result = newVersion(ver = tag)
