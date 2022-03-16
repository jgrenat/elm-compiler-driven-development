module Exercise030Matches exposing (..)

import Html exposing (Html, button, div, img, span, text)
import Html.Attributes exposing (src, width)


matchImage =
    img [ src "https://freesvg.org/img/1577808279match.png", width 50 ] []


main =
    -- it seems to be two compilation errors here... I have the feeling
    -- the second one would be more helpful
    div []
        (List.repeat
            matchImage
            50
        )
