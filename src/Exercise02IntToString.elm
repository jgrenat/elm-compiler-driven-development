module Exercise02IntToString exposing (main)

import Browser
import Html exposing (Html, button, div, h1, span, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 0 }


type Msg
    = Increment


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }


view : Model -> Html Msg
view model =
    div [ style "padding" "1rem" ]
        [ span [] [ text <| String.fromInt model.count ]
        , text " "
        , button [ onClick Increment ] [ text "+1" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
