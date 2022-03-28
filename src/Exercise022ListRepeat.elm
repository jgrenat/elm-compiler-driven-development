module Exercise022ListRepeat exposing (..)

import Browser
import Html exposing (Html, button, div, img, span, text)
import Html.Attributes exposing (src, style)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int }


initialModel : Model
initialModel =
    { count = 1 }


type Msg
    = Increment


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }


view : Model -> Html Msg
view model =
    -- Il y a deux erreurs de compilation ici... Quelque chose me dit que la seconde
    -- est peut-être la plus utile...
    div [ style "padding" "1rem" ]
        [ button [ onClick Increment, style "margin-bottom" "1em" ] [ text "Ajouter une allumette" ]
        , div [] (List.repeat image model.count)
        ]


image =
    img [ src "https://freesvg.org/img/1577808279match.png", style "width" "30px" ] []


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
