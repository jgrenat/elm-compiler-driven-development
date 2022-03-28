module Exercise018CustomTypes exposing (..)

import Html exposing (li, text, ul)
import Html.Attributes exposing (id, style)


type Color
    = Red
    | Green


main =
    ul []
        [ li [ style "color" (colorToString Red) ] [ text "Ce texte est en rouge" ]
        , li [ style "color" (colorToString Green) ] [ text "Ce texte est en vert (j'espère)" ]
        ]


colorToString : Color -> String
colorToString color =
    case color of
        Red ->
            "red"
