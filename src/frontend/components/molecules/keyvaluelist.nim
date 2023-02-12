import pkg/owlkettle
import ../atoms/[h3, p]
import std/options

type KeyValuePair* = tuple[key: string, value: string]

viewable KeyValueDisplayList:
  items: seq[KeyValuePair]
  heading: Option[KeyValuePair] = none(KeyValuePair)
  boxSpace: int = 12  ## Space between Key and value


method view*(state: KeyValueDisplayListState): Widget =
  gui:
    Box(orient = OrientX):

      Box(orient = OrientY, margin = Margin(right: state.boxSpace)){.hAlign: AlignStart.}:
        if state.heading.isSome():
          H3(text = state.heading.get().key, fontWeight = h3.bold, margin = Margin(bottom: 10))

        for (key, value) in state.items:
          P(text = key, fontWeight = p.bold)

      Box(orient = OrientY){.hAlign: AlignEnd.}:
        if state.heading.isSome():
          H3(text = state.heading.get().value, fontWeight = h3.bold, margin = Margin(bottom: 10))

        for (key, value) in state.items:
          P(text = value)


export KeyValueDisplayList