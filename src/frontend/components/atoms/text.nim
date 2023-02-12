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

type FontSize = enum
  xxsmall = "xx-small"
  xsmall = "x-small"
  small = "small"
  medium = "medium"
  large = "large"
  xlarge = "x-large"
  xxlarge = "xx-large"

proc buildLabelRepr[T](state: T, size: FontSize): string =
  var properties = fmt"""weight="{state.fontWeight}" text_transform="capitalize" size="{$size}" """

  result = fmt"<span {properties}>{state.text}</span>"



# H1 
viewable H1:
  text: string
  fontWeight: FontWeight = Fontweight.normal
  margin: Margin = Margin(bottom: 8)

proc buildLabelRepr(state: H1State): string =
  result = buildLabelRepr(state, FontSize.xxlarge)

method view*(state: H1State): Widget =
  gui:
    Label:
      margin = state.margin
      useMarkup = true
      text = state.buildLabelRepr()

export H1



# H2
viewable H2:
  text: string
  fontWeight: FontWeight = Fontweight.normal
  margin: Margin = Margin(bottom: 4)

proc buildLabelRepr(state: H2State): string =
  result = buildLabelRepr(state, FontSize.xlarge)

method view*(state: H2State): Widget =
  gui:
    Label:
      margin = state.margin
      useMarkup = true
      text = state.buildLabelRepr()

export H2



# H3
viewable H3:
  text: string
  fontWeight: FontWeight = Fontweight.normal
  margin: Margin = Margin(bottom: 2)

proc buildLabelRepr(state: H3State): string =
  result = buildLabelRepr(state, FontSize.large)

method view*(state: H3State): Widget =
  gui:
    Label:
      margin = state.margin
      useMarkup = true
      text = state.buildLabelRepr()

export H3



# P
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
