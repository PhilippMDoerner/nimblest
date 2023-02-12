import pkg/owlkettle
import std/strformat

viewable H2:
  text: string
  fontWeight: FontWeight = Fontweight.normal

proc buildLabelRepr(state: H2State): string =
  var properties = fmt"""weight="{state.fontWeight}" text_transform="capitalize" size="x-large" """

  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: H2State): Widget =
  gui:
    Label:
      useMarkup = true
      text = state.buildLabelRepr()

export H2