import pkg/owlkettle
import std/strformat

viewable P:
  text: string
  fontWeight: FontWeight = Fontweight.normal

proc buildLabelRepr(state: PState): string =
  var properties = fmt"""weight="{state.fontWeight}" size="large" """

  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: PState): Widget =
  gui:
    Label:
      useMarkup = true
      text = state.buildLabelRepr()

export P