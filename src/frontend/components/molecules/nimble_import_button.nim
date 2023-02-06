import pkg/owlkettle

viewable NimbleImportButton:
  discard

method view*(state: NimbleImportButtonState): Widget =
  gui:
    Button:
      text = "Add project"
      proc clicked() =
        discard

export NimbleImportButton