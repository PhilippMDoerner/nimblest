import pkg/owlkettle
import std/strformat

type FontWeight* = enum
  ultralight
  light
  normal
  bold
  ultrabold
  heavy

viewable P:
  text: string
  fontWeight: FontWeight = Fontweight.normal

proc buildLabelRepr(state: PState): string =
  var properties = fmt"""weight="{state.fontWeight}" size="large" """

  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: PState): Widget =
  gui:
    Label {.expand: false.}:
      useMarkup = true
      text = state.buildLabelRepr()

export P