import pkg/owlkettle
import ../atoms/text
import std/options
import ../../../types

export KeyValuePair

viewable KeyValueDisplayList:
  items: seq[KeyValuePair]
  heading: Option[KeyValuePair] = none(KeyValuePair)
  spacing: int = 12  ## Space between Key and value


method view*(state: KeyValueDisplayListState): Widget =
  gui:
    Box(orient = OrientX, spacing = state.spacing) {.vAlign: AlignStart.}:
      # Let Box
      Box(orient = OrientY){.hAlign: AlignStart, vAlign: AlignStart.}:
        # Heading
        if state.heading.isSome():
          H3(text = state.heading.get().key, fontWeight = bold)
        
        # Body
        Box(orient = OrientY) {.vAlign: AlignStart.}:
          for (key, value) in state.items:
            P(text = key, fontWeight = bold)
      
      # Right Box
      Box(orient = OrientY){.hAlign: AlignEnd, vAlign: AlignStart.}:
        # Heading
        if state.heading.isSome():
          H3(text = state.heading.get().value, fontWeight = bold)

        # Body
        Box(orient = OrientY) {.vAlign: AlignStart.}:
          for (key, value) in state.items:
            P(text = value)


export KeyValueDisplayList