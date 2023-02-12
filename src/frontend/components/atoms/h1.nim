import pkg/owlkettle
import std/strformat

type FontWeight* = enum
  ultralight
  light
  normal
  bold
  ultrabold
  heavy

viewable H1:
  text: string
  fontWeight: FontWeight = Fontweight.normal

proc buildLabelRepr(state: H1State): string =
  var properties = fmt"""weight="{state.fontWeight}" text_transform="capitalize" size="xx-large" """

  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: H1State): Widget =
  gui:
    Label {.expand: false.}:
      useMarkup = true
      text = state.buildLabelRepr()

export H1