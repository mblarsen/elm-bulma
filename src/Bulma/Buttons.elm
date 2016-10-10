module Bulma.Buttons
    exposing
        ( ButtonType(..)
        , ButtonModifier(..)
        , btn
        , btnDanger
        , btnDefault
        , btnGroup
        , btnInfo
        , btnLink
        , btnPrimary
        , btnSuccess
        , btnWarning
        )

{-| Buttons
# Types
@docs ButtonType, ButtonModifier

# Buttons
@docs btn, btnDanger, btnDefault, btnInfo, btnLink, btnPrimary, btnSuccess, btnWarning

# Groups
@docs btnGroup
-}

import Html exposing (..)
import Html.Attributes exposing (class)
import String
import Bulma.Icons exposing (icn, Icon(..), IconSize(..))


type RenderStyle
    = RenderAsButton
    | RenderAsAnchorIconAfter IconSize
    | RenderAsAnchorIconBefore IconSize


{-| Button types
-}
type ButtonType
    = BtnDefault
    | BtnPrimary
    | BtnInfo
    | BtnSuccess
    | BtnWarning
    | BtnDanger
    | BtnWhite
    | BtnLight
    | BtnDark
    | BtnBlack
    | BtnLink


{-| Button modifiers. A button may have several modifiers, however some are
incompatible.
-}
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
    | BtnIcon IconSize
    | BtnIconAfter IconSize


{-| Groups several buttons together.
-}
btnGroup : List (Html msg) -> List (Attribute msg) -> Html msg
btnGroup buttons attributes =
    div
        ((class "control is-grouped")
            :: attributes
        )
        (List.map (\b -> p [ class "control" ] [ b ]) buttons)


{-| Default button
-}
btnDefault : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnDefault modifiers attributes children =
    btn BtnDefault modifiers attributes children


{-| Primary button
-}
btnPrimary : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnPrimary modifiers attributes buttonText =
    btn BtnPrimary modifiers attributes buttonText


{-| Info button
-}
btnInfo : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnInfo modifiers attributes buttonText =
    btn BtnInfo modifiers attributes buttonText


{-| Success button
-}
btnSuccess : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnSuccess modifiers attributes buttonText =
    btn BtnSuccess modifiers attributes buttonText


{-| Warning button
-}
btnWarning : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnWarning modifiers attributes buttonText =
    btn BtnWarning modifiers attributes buttonText


{-| Danger button
-}
btnDanger : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnDanger modifiers attributes buttonText =
    btn BtnDanger modifiers attributes buttonText


{-| Link button
-}
btnLink : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btnLink modifiers attributes buttonText =
    btn BtnLink modifiers attributes buttonText


{-| Creates button of ButtonType
-}
btn : ButtonType -> List ButtonModifier -> List (Attribute msg) -> String -> Html msg
btn type' modifiers attributes buttonText =
    let
        classAttribute =
            (typeToString type')
                :: List.map modifierToString modifiers
                |> (::) "button"
                |> String.join " "
                |> class

        combinedAttributes =
            classAttribute :: attributes
    in
        render (determineRenderStyle modifiers) combinedAttributes buttonText


determineRenderStyle : List ButtonModifier -> RenderStyle
determineRenderStyle modifiers =
    case modifiers of
        [] ->
            RenderAsButton

        hd :: tl ->
            case hd of
                BtnIcon icon ->
                    RenderAsAnchorIconBefore icon

                BtnIconAfter icon ->
                    RenderAsAnchorIconAfter icon

                _ ->
                    determineRenderStyle tl


render : RenderStyle -> List (Attribute msg) -> String -> Html msg
render element attributes buttonText =
    case element of
        RenderAsButton ->
            button attributes [ text buttonText ]

        RenderAsAnchorIconAfter anIcon ->
            a attributes
                [ span [] [ text buttonText ], icn anIcon [] ]

        RenderAsAnchorIconBefore anIcon ->
            a attributes
                [ icn anIcon [], span [] [ text buttonText ] ]


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

        BtnIcon icon ->
            ""

        BtnIconAfter icon ->
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

        BtnWhite ->
            "is-white"

        BtnLight ->
            "is-light"

        BtnDark ->
            "is-dark"

        BtnBlack ->
            "is-black"

        BtnLink ->
            "is-link"
