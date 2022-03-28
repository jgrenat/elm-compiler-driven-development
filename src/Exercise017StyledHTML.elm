module Exercise017StyledHTML exposing (..)

import Html exposing (li, text, ul)
import Html.Attributes exposing (id, style)


main =
    ul []
        [ li [ style "color" "red" ] [ text "Ce texte est en rouge" ]
        , li [ id "greenText", style "color-green" ] [ text "Ce texte est en vert (j'espère)" ]
        ]
