module Main (..) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Task exposing (Task, succeed)
import Effects exposing (Never)
import History exposing (..)


-- MODEL


type SignalKind
  = Hash
  | Href
  | Path


type alias Model =
  { hash : String
  , href : String
  , path : String
  }


newModel : Model
newModel =
  { hash = ""
  , href = ""
  , path = ""
  }



-- UPDATE


update : ( SignalKind, String ) -> Model -> Model
update ( kind, payload ) model =
  case kind of
    Hash ->
      { model | hash = payload }

    Href ->
      { model | href = payload }

    Path ->
      { model | path = payload }



-- INCOMING SIGNALS


hashSignal : Signal ( SignalKind, String )
hashSignal =
  Signal.map (\str -> ( Hash, str )) History.hash


hrefSignal : Signal ( SignalKind, String )
hrefSignal =
  Signal.map (\str -> ( Href, str )) History.href


pathSignal : Signal ( SignalKind, String )
pathSignal =
  Signal.map (\str -> ( Path, str )) History.path


historySignals : Signal ( SignalKind, String )
historySignals =
  Signal.mergeMany [ hashSignal, hrefSignal, pathSignal ]


modelSignal : Signal Model
modelSignal =
  Signal.foldp update newModel historySignals



-- FXs


setPathFx : Task Never ()
setPathFx =
  setPath "/monkeys"


setHashFx : Task Never ()
setHashFx =
  setHash "#monkeys"



-- TASKS MAILBOX


mb : Signal.Mailbox (Task Never ())
mb =
  Signal.mailbox (succeed ())



-- VIEWS


btnFx : String -> Task Never () -> Html
btnFx viewId fx =
  button
    [ id viewId
    , onClick mb.address fx
    ]
    [ text viewId ]


viewSignal : String -> String -> Html
viewSignal viewId value =
  div
    []
    [ span [] [ text (viewId ++ ": ") ]
    , span [ id viewId ] [ text value ]
    ]


view : Model -> Html
view model =
  div
    []
    [ viewSignal "hash" model.hash
    , viewSignal "href" model.href
    , viewSignal "path" model.path
    , btnFx "btnSetPath" setPathFx
    , btnFx "btnSetHash" setHashFx
    ]


main : Signal Html
main =
  Signal.map view modelSignal


port tasks : Signal (Task Never ())
port tasks =
  mb.signal
