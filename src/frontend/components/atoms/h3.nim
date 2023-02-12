import pkg/owlkettle
import std/strformat

viewable H3:
  text: string
  fontWeight: FontWeight = Fontweight.normal

proc buildLabelRepr(state: H3State): string =
  var properties = fmt"""weight="{state.fontWeight}" text_transform="capitalize" size="large" """

  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: H3State): Widget =
  gui:
    Label:
      useMarkup = true
      text = state.buildLabelRepr()

export H3