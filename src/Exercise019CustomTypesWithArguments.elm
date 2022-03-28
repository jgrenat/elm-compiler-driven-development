module Exercise019CustomTypesWithArguments exposing (..)

import Html exposing (li, text, ul)
import Html.Attributes exposing (id, style)


type Shape
    = Point
    | Square Float
    | Rectangle Float Float


main =
    Html.text
        ("Un rectangle de côtés 5cm et 3cm a une superficie de "
            ++ String.fromFloat (calculateArea (Rectangle 5 3))
            ++ " cm2"
        )


calculateArea : Shape -> Float
calculateArea shape =
    case shape of
        Point ->
            0

        Square side ->
            side * side

        Rectangle width ->
            width
