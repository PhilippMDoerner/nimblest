import pkg/owlkettle
import std/strformat

type FontWeight* = enum
  ultralight
  light
  normal
  bold
  ultrabold
  heavy

viewable H2:
  text: string
  fontWeight: FontWeight = Fontweight.normal
  margin: Margin = Margin(bottom: 14)

proc buildLabelRepr(state: H2State): string =
  var properties = fmt"""weight="{state.fontWeight}" text_transform="capitalize" size="x-large" """

  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: H2State): Widget =
  gui:
    Label {.expand: false.}:
      useMarkup = true
      text = state.buildLabelRepr()

export H2