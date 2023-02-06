import owlkettle

viewable LeftLabel:
  text: string

method view*(state: LeftLabelState): Widget =
  gui:
    Label:
      text = state.text
      x_align = 0
      ellipsize = EllipsizeMode.EllipsizeEnd

export LeftLabel