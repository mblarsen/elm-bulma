module Bulma.Buttons exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import String
import Bulma.Icons exposing (Icon)


type ButtonType
    = BtnDefault
    | BtnPrimary
    | BtnInfo
    | BtnSuccess
    | BtnWarning
    | BtnDanger
    | BtnLink


type ButtonModifier
    = BtnSmall
    | BtnNormal
    | BtnMedium
    | BtnLarge
    | BtnOutlined
    | BtnInverted
    | BtnLoading
    | BtnActive
    | BtnDisabled
    | BtnIconAfter Icon
    | BtnIconBefore Icon


btnGroup : List (Html msg) -> List (Attribute msg) -> Html msg
btnGroup buttons attributes =
    div
        ((class "control is-grouped")
            :: attributes
        )
        (List.map (\b -> p [ class "control" ] [ b ]) buttons)


btnDefault : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnDefault modifiers attributes children =
    btn BtnDefault modifiers attributes children


btnPrimary : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnPrimary modifiers attributes children =
    btn BtnPrimary modifiers attributes children


btnInfo : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnInfo modifiers attributes children =
    btn BtnInfo modifiers attributes children


btnSuccess : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnSuccess modifiers attributes children =
    btn BtnSuccess modifiers attributes children


btnWarning : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnWarning modifiers attributes children =
    btn BtnWarning modifiers attributes children


btnDanger : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnDanger modifiers attributes children =
    btn BtnDanger modifiers attributes children


btnLink : List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btnLink modifiers attributes children =
    btn BtnLink modifiers attributes children


btn : ButtonType -> List ButtonModifier -> List (Attribute msg) -> List (Html msg) -> Html msg
btn type' modifiers attributes children =
    let
        classAttribute =
            (typeToString type')
                :: List.map modifierToString modifiers
                |> (::) "button"
                |> String.join " "
                |> class

        buttonAttributes =
            classAttribute :: attributes
    in
        button buttonAttributes children


modifierToString : ButtonModifier -> String
modifierToString modifier =
    case modifier of
        BtnSmall ->
            "is-small"

        BtnNormal ->
            "is-normal"

        BtnMedium ->
            "is-medium"

        BtnLarge ->
            "is-large"

        BtnOutlined ->
            "is-outlined"

        BtnInverted ->
            "is-inverted"

        BtnLoading ->
            "is-loading"

        BtnActive ->
            "is-active"

        BtnDisabled ->
            "is-disabled"

        BtnIconAfter icon ->
            ""

        BtnIconBefore icon ->
            ""


typeToString : ButtonType -> String
typeToString type' =
    case type' of
        BtnDefault ->
            ""

        BtnPrimary ->
            "is-primary"

        BtnInfo ->
            "is-info"

        BtnSuccess ->
            "is-success"

        BtnWarning ->
            "is-warning"

        BtnDanger ->
            "is-danger"

        BtnLink ->
            "is-link"
