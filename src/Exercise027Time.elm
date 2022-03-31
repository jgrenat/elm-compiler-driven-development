module Exercise027Time exposing (..)

import Browser
import Html exposing (..)
import Task
import Time



-- On cherche à afficher l'heure courante. Pour cela, on doit "s'abonner" (subscribe en anglais) à l'heure
-- courante : le runtime va envoyer des messages régulièrement contenant l'heure courante (sous forme de
-- timestamp/posix).
--
-- Ainsi, on se protège encore une fois du monde extérieur 😷.


type alias Model =
    { zone : Time.Zone
    , time : Time.Posix
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { zone = Time.utc, time = Time.millisToPosix 0 }
    , -- Elm nous force à gérer la time zone séparément de l'heure, ce qui nous évite beaucoup de pièges liés
      -- à la gestion du temps (voir https://gist.github.com/timvisee/fcda9bbdff88d45cc9061606b4b923ca).
      --
      -- Ici, cette commande récupère la time zone de l'utilisateur.
      Task.perform TimeZoneReceived Time.here
    )


type Msg
    = Tick Time.Posix
    | TimeZoneReceived Time.Zone


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( { model | time = newTime }
            , Cmd.none
            )

        TimeZoneReceived newZone ->
            ( { model | zone = newZone }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    -- Mais comment spécifier qu'on veut générer un message "Tick" toutes les 1000 millisecondes ?
    Time.every 1000


view : Model -> Html Msg
view model =
    let
        hour =
            String.fromInt (Time.toHour model.zone model.time)

        second =
            String.fromInt (Time.toSecond model.zone model.time)
    in
    h1 [] [ text (hour ++ ":" ++ minute ++ ":" ++ second) ]


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
