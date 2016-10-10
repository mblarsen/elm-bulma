module Main exposing (..)

import Html exposing (Html, div, text, h1)
import Html.Attributes exposing (id, class, style)
import Html.Events exposing (onClick)
import Html.App as Html
import Bulma.Buttons exposing (..)
import Bulma.Icons exposing (..)
import Bulma.Notifications exposing (..)


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
    Int


initialModel : Model
initialModel =
    0


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | Increment


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

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
        [ h1 [ class "title" ] [ text "Demo" ]
        , buttonGroup
            [ defaultButton [] [] "Click me"
            , button BtnPrimary [] [] "Click me"
            , defaultButtonWithIcon [] [] "Click me" (normalIcon IconLock [])
            , buttonWithIcon BtnPrimary [] [] "Click me" (normalIcon IconLock [])
            ]
            []
        , buttonGroup
            [ button BtnPrimary [] [] "I'm dangerous"
            , defaultButton [] [] "Not like me"
            , button BtnLink [] [] "Not like me"
            , button BtnLink [] [] "Especially not like me"
            , button BtnLink [ BtnActive ] [] "Active"
            , button BtnLink [ BtnDisabled ] [] "Disabled"
            , button BtnLink [ BtnLoading ] [] "Loading"
            , button BtnLink [ BtnInverted ] [] "Inverted"
            , button BtnLink [ BtnOutlined ] [] "Outlined"
            , buttonWithIcon BtnLight [ BtnIconAfter ] [] "Outlined" (normalIcon IconTimes [])
            ]
            []
        , buttonGroup
            [ button BtnDanger [] [] "I'm dangerous"
            , warningButton [] [] "Not like me"
            , button BtnLink [] [] "Not like me"
            , button BtnDanger [] [] "Especially not like me"
            , button BtnDanger [ BtnActive ] [] "Active"
            , button BtnDanger [ BtnDisabled ] [] "Disabled"
            , button BtnDanger [ BtnLoading ] [] "Loading"
            , button BtnDanger [ BtnInverted ] [] "Inverted"
            , button BtnDanger [ BtnOutlined ] [] "Outlined"
            ]
            []
        , warningButtonWithIcon [] [] "Unlock" (smallIcon IconLock [])
        , dangerButtonWithIcon [ BtnSmall, BtnIconAfter ] [] "Delete" (smallIcon IconTimes [])
        , buttonWithIcon BtnSuccess [ BtnLarge, BtnOutlined ] [] "" (normalIcon IconShoppingCart [])
        , div []
            [ largeIcon IconShoppingCart []
            , mediumIcon IconShoppingCart []
            , normalIcon IconShoppingCart []
            , smallIcon IconShoppingCart []
            , icon IconSmall IconShoppingCart []
            ]
        , div [] [ text (toString model) ]
        , div [ style [ ( "background-color", "white" ) ] ]
            [ notification NotificationDefault [ onClick Increment ] [] [ text "Click close button to test onClick" ]
            , notification NotificationInfo [] [ onClick Increment ] [ text "Click me to test onClick" ]
            , notification NotificationSuccess [] [] [ text "Info lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor sit amet, consectetur adipiscing eli" ]
            , notification NotificationDanger [] [] [ text "Info lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor sit amet, consectetur adipiscing eli" ]
            ]
        ]
