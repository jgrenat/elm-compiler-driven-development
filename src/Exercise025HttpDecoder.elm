module Exercise025HttpDecoder exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode exposing (Decoder)


type Model
    = Failure String
    | Loading
    | Success Cat


type alias Cat =
    { title : String
    , url : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, getRandomCatGif )


type Msg
    = CatButtonClicked
    | GifReceived (Result Http.Error Cat)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CatButtonClicked ->
            ( Loading, getRandomCatGif )

        GifReceived result ->
            case result of
                Ok cat ->
                    ( Success cat, Cmd.none )

                Err error ->
                    case error of
                        Http.BadBody errorMsg ->
                            ( Failure errorMsg, Cmd.none )

                        _ ->
                            ( Failure "Erreur Http !", Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Random Cats" ]
        , viewGif model
        ]


viewGif : Model -> Html Msg
viewGif model =
    case model of
        Failure errorMsg ->
            div []
                [ text ("Une erreur est survenue : " ++ errorMsg)
                , button [ onClick CatButtonClicked ] [ text "Retente !" ]
                ]

        Loading ->
            text "Chargement..."

        Success cat ->
            div []
                [ h1 [] [ text cat.title ]
                , button [ onClick CatButtonClicked, style "display" "block" ] [ text "Une autre !" ]
                , img [ src cat.url ] []
                ]


getRandomCatGif : Cmd Msg
getRandomCatGif =
    Http.get
        { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat"
        , expect = Http.expectJson GifReceived gifDecoder
        }


gifDecoder : Decoder Cat
gifDecoder =
    -- Elm ne peut pas deviner la forme du JSON qu'on reçoit, il faut donc lui indiquer quels champs
    -- nous intéressent avec ce décodeur.
    --
    -- Le JSON ressemble à :
    -- {
    --   "data": {
    --     "title": "Tired cat",
    --     "images" : { "original": { "url" : "http://...", ...}, ...},
    --     ...,
    --   },
    --   ...,
    -- }
    -- Vous pouvez voir sa forme complète au lien suivant :
    -- https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat
    Json.Decode.map2 Cat
        (Json.Decode.at [ "data", "title" ] Json.Decode.int)
        (Json.Decode.at [ "data", "images", "original", "url" ] Json.Decode.string)


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }



-- Inspiré de l'exemple :
-- https://elm-lang.org/examples/cat-gifs
