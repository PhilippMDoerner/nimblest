import pkg/owlkettle
import std/strformat

type FontWeight* = enum
  ultralight
  light
  normal
  bold
  ultrabold
  heavy

type FontAlignment* = enum
  faLeft
  faRight
  faCenter

viewable P:
  text: string
  alignment: FontAlignment = FontAlignment.faLeft
  fontWeight: FontWeight = Fontweight.normal

proc buildLabelRepr(state: PState): string =
  var properties = fmt"""weight="{state.fontWeight}" size="large" """
  result = fmt"<span {properties}>{state.text}</span>"


method view*(state: PState): Widget =
  let alignment: float = case state.alignment:
    of FontAlignment.faLeft:
      0.0
    of FontAlignment.faRight:
      1.0
    of FontAlignment.faCenter:
      0.5

  gui:
    Label:
      useMarkup = true
      xAlign = alignment
      text = state.buildLabelRepr()

export P