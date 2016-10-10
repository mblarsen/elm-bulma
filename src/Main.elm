module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, class, style)
import Html.Events exposing (onClick)
import Html.App as Html
import Bulma.Buttons exposing (..)
import Bulma.Icons exposing (..)
import Bulma.Notifications exposing (..)


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
        [ text ""
        , btnPrimary [] [] "Click me"
        , btnSuccess [ BtnSmall, BtnInverted ] [] "Click me"
        , btnPrimary [ BtnLarge, BtnLoading ] [] "Click me"
        , btnGroup
            [ btnPrimary [] [] "I'm dangerous"
            , btnLink [] [] "Not like me"
            , btnDanger [] [] "Especially not like me"
            , btn BtnDanger [ BtnActive ] [] "Active"
            , btn BtnDanger [ BtnDisabled ] [] "Disabled"
            , btn BtnDanger [ BtnLoading ] [] "Loading"
            , btn BtnDanger [ BtnInverted ] [] "Inverted"
            , btn BtnDanger [ BtnOutlined ] [] "Outlined"
            ]
            []
        , btnGroup
            [ btn BtnLight [] [] "I'm dangerous"
            , btnLink [] [] "Not like me"
            , btn BtnDark [] [] "Especially not like me"
            , btn BtnDark [ BtnActive ] [] "Active"
            , btn BtnDark [ BtnDisabled ] [] "Disabled"
            , btn BtnDark [ BtnLoading ] [] "Loading"
            , btn BtnDark [ BtnInverted ] [] "Inverted"
            , btn BtnDark [ BtnOutlined ] [] "Outlined"
            ]
            []
        , btnGroup
            [ btn BtnInfo [] [] "I'm dangerous"
            , btnLink [] [] "Not like me"
            , btn BtnBlack [] [] "Especially not like me"
            , btn BtnBlack [ BtnActive ] [] "Active"
            , btn BtnBlack [ BtnDisabled ] [] "Disabled"
            , btn BtnBlack [ BtnLoading ] [] "Loading"
            , btn BtnBlack [ BtnInverted ] [] "Inverted"
            , btn BtnBlack [ BtnOutlined ] [] "Outlined"
            ]
            []
        , btnWarning [ BtnIcon (IconNormal IconLock) ] [] "Unlock"
        , btnDanger [ BtnSmall, BtnIconAfter (IconSmall IconTimes) ] [] "Delete"
        , btnSuccess [ BtnLarge, BtnOutlined, BtnIcon (IconNormal IconLock) ] [] ""
        , div []
            [ icn (IconLarge IconShoppingCart) [ class "is-info" ]
            , icn (IconMedium IconShoppingCart) [ class "is-info" ]
            , icn (IconNormal IconShoppingCart) [ class "is-info" ]
            , icn (IconSmall IconShoppingCart) [ class "is-info" ]
            ]
        , div [] [ text (toString model) ]
        , div [ style [ ( "background-color", "white" ) ] ]
            [ notification NotificationDefault [ onClick Increment ] [] [ text "Click close button to test onClick" ]
            , notification NotificationInfo [] [ onClick Increment ] [ text "Click me to test onClick" ]
            , notification NotificationSuccess [] [] [ text "Info lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor sit amet, consectetur adipiscing eli" ]
            , notification NotificationDanger [] [] [ text "Info lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor sit amet, consectetur adipiscing eli" ]
            ]
        ]
