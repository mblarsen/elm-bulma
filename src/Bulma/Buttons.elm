module Bulma.Buttons
    exposing
        ( ButtonType(..)
        , ButtonModifier(..)
        , button
        , buttonWithIcon
        , buttonGroup
        , buttonAddonGroup
          ---------------------------------------------------
        , defaultButton
        , primaryButton
        , infoButton
        , successButton
        , warningButton
        , dangerButton
        , linkButton
        , lightButton
          ---------------------------------------------------
        , defaultButtonWithIcon
        , primaryButtonWithIcon
        , infoButtonWithIcon
        , successButtonWithIcon
        , warningButtonWithIcon
        , dangerButtonWithIcon
        , linkButtonWithIcon
        , lightButtonWithIcon
        )

{-| Buttons
# Types
@docs ButtonType, ButtonModifier

# Buttons
@docs button, defaultButton, primaryButton, infoButton, successButton, warningButton, dangerButton, linkButton, lightButton

# Buttons with icons
@docs buttonWithIcon, defaultButtonWithIcon, primaryButtonWithIcon, infoButtonWithIcon, successButtonWithIcon, warningButtonWithIcon, dangerButtonWithIcon, linkButtonWithIcon, lightButtonWithIcon

# Groups
@docs buttonGroup, buttonAddonGroup
-}

import Html exposing (..)
import Html.Attributes exposing (class)
import String
import Bulma.Icons exposing (Icon(..), IconSize(..))


type RenderStyle
    = RenderAsButton
    | RenderAsAnchorIconAfter
    | RenderAsAnchorIconBefore


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
    | BtnIconAfter


{-| Default button
-}
defaultButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
defaultButton modifiers attributes buttonText =
    button BtnDefault modifiers attributes buttonText


{-| Default button with icon
-}
defaultButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
defaultButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnDefault modifiers attributes children anIcon


{-| Primary button
-}
primaryButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
primaryButton modifiers attributes buttonText =
    button BtnPrimary modifiers attributes buttonText


{-| Primary button with icon
-}
primaryButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
primaryButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnPrimary modifiers attributes children anIcon


{-| Info button
-}
infoButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
infoButton modifiers attributes buttonText =
    button BtnInfo modifiers attributes buttonText


{-| Info button with icon
-}
infoButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
infoButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnInfo modifiers attributes children anIcon


{-| Success button
-}
successButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
successButton modifiers attributes buttonText =
    button BtnSuccess modifiers attributes buttonText


{-| Success button with icon
-}
successButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
successButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnSuccess modifiers attributes children anIcon


{-| Warning button
-}
warningButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
warningButton modifiers attributes buttonText =
    button BtnWarning modifiers attributes buttonText


{-| Warning button with icon
-}
warningButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
warningButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnWarning modifiers attributes children anIcon


{-| Danger button
-}
dangerButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
dangerButton modifiers attributes buttonText =
    button BtnDanger modifiers attributes buttonText


{-| Danger button with icon
-}
dangerButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
dangerButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnDanger modifiers attributes children anIcon


{-| Link button
-}
linkButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
linkButton modifiers attributes buttonText =
    button BtnLink modifiers attributes buttonText


{-| Link button with icon
-}
linkButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
linkButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnLink modifiers attributes children anIcon


{-| Light button
-}
lightButton : List ButtonModifier -> List (Attribute msg) -> String -> Html msg
lightButton modifiers attributes buttonText =
    button BtnLight modifiers attributes buttonText


{-| Light button with icon
-}
lightButtonWithIcon : List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
lightButtonWithIcon modifiers attributes children anIcon =
    buttonWithIcon BtnLight modifiers attributes children anIcon



---------------------------------------------------


{-| Groups several buttons together.
-}
buttonGroup : List (Html msg) -> List (Attribute msg) -> Html msg
buttonGroup buttons attributes =
    div
        ((class "control is-grouped")
            :: attributes
        )
        (List.map (\b -> p [ class "control" ] [ b ]) buttons)


{-| Groups several buttons together.
-}
buttonAddonGroup : List (Html msg) -> List (Attribute msg) -> Html msg
buttonAddonGroup buttons attributes =
    div
        ((class "control has-addons")
            :: attributes
        )
        buttons



-- (List.map (\b -> p [ class "control" ] [ b ]) buttons)


{-| Creates button of ButtonType
-}
button : ButtonType -> List ButtonModifier -> List (Attribute msg) -> String -> Html msg
button type' modifiers attributes buttonText =
    let
        combinedAttributes =
            (buttonClass type' modifiers) :: attributes
    in
        render RenderAsButton combinedAttributes buttonText Nothing


{-| Creates button of ButtonType and insert icon. Use `BtnIconAfter` modifier
to move icon to the right.
-}
buttonWithIcon : ButtonType -> List ButtonModifier -> List (Attribute msg) -> String -> Html msg -> Html msg
buttonWithIcon type' modifiers attributes buttonText icon =
    let
        combinedAttributes =
            (buttonClass type' modifiers) :: attributes
    in
        render (determineRenderStyle modifiers) combinedAttributes buttonText (Just icon)


determineRenderStyle : List ButtonModifier -> RenderStyle
determineRenderStyle modifiers =
    let
        hasAfterModifier =
            List.filter (\m -> m == BtnIconAfter) modifiers
    in
        case List.head hasAfterModifier of
            Just _ ->
                RenderAsAnchorIconAfter

            Nothing ->
                RenderAsAnchorIconBefore


buttonClass : ButtonType -> List ButtonModifier -> Attribute msg
buttonClass type' modifiers =
    (typeToString type')
        :: List.map modifierToString modifiers
        |> (::) "button"
        |> String.join " "
        |> class


render : RenderStyle -> List (Attribute msg) -> String -> Maybe (Html msg) -> Html msg
render element attributes buttonText maybeIcon =
    case element of
        RenderAsButton ->
            Html.button attributes [ text buttonText ]

        RenderAsAnchorIconAfter ->
            a attributes
                [ span [] [ text buttonText ], Maybe.withDefault (text "Icon missing") maybeIcon ]

        RenderAsAnchorIconBefore ->
            a attributes
                [ Maybe.withDefault (text "Icon missing") maybeIcon, span [] [ text buttonText ] ]


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

        BtnIconAfter ->
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
