module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, class)
import Html.App as Html
import Bulma.Buttons exposing (..)


--import Html.Attributes exposing (..)
--import Html.Events exposing (onClick)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    {}


initialModel : Model
initialModel =
    {}


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text ""
        , btnPrimary [] [] [ text "Click me" ]
        , btnSuccess [ BtnSmall, BtnInverted ] [] [ text "Click me" ]
        , btnPrimary [ BtnLarge, BtnLoading ] [] [ text "Click me" ]
        , btnGroup
            [ btnPrimary [] [] [ text "I'm dangerous" ]
            , btnLink [] [] [ text "Not like me" ]
            , btnDanger [ BtnDisabled ] [] [ text "Especially not like me" ]
            ]
            []
        ]
