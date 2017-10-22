module Component.Counter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Debug exposing (log)

main =
  Html.program
    { init = init,
      update = update,
      view = view,
      subscriptions = subscriptions
    }

-- MODEL

type alias Model = Int
model : Model
model = 1

init : ( Model, Cmd Msg )
init =
  ( 0, Cmd.none )


-- UPDATE

type Msg = Inc | Dec

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
  Inc -> (model + 1, Cmd.none )
  Dec -> (model - 1, Cmd.none )

set : Model -> Model
set model = model


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Dec ] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick Inc ] [ text "+" ]
    ]

countStyle : Attribute style
countStyle =
  style
  [ ("font-size", "20px")
  , ("font-family", "monospace")
  , ("display", "inline-block")
  , ("width", "50px")
  , ("text-align", "center")
  ]