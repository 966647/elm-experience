module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Debug exposing (log)
import Component.Counter as Counter

main =
  Html.program
    {
    init = init,
    update = update,
    view = view,
    subscriptions = subscriptions
    }

-- MODEL

type alias Model = {counter : Counter.Model}

init : ( Model, Cmd Msg )
init =
  ( Model 0, Cmd.none )


-- UPDATE

type Msg = Reset | CounterMsg Counter.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    CounterMsg counterMsg ->
      let
        counterModel =
          case counterMsg of
            Counter.Inc -> log "incremented" model.counter
            Counter.Dec -> log "decremented" model.counter
        (updatedCounterModel, _) = Counter.update counterMsg counterModel
      in ({model | counter = updatedCounterModel}, Cmd.none )
    Reset -> (Model (log "resetted" 0), Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ Html.map CounterMsg (Counter.view model.counter),
      button [onClick Reset] [text "Reset"]]

