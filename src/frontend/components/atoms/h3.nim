import pkg/owlkettle
import std/strformat

type FontWeight* = enum
  ultralight
  light
  normal
  bold
  ultrabold
  heavy

viewable H3:
  text: string
  fontWeight: FontWeight = Fontweight.normal
  margin: Margin = Margin(bottom: 2)

proc buildLabelRepr(state: H3State): string =
  var properties = fmt"""weight="{state.fontWeight}" text_transform="capitalize" size="large" """

  result = fmt"<span {properties}>{state.text}</span>"

method view*(state: H3State): Widget =
  gui:
    Label {.expand: false.}:
      useMarkup = true
      text = state.buildLabelRepr()

export H3