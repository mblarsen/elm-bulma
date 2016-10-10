module Bulma.Icons
    exposing
        ( Icon(..)
        , IconSize(..)
        , icon
        , normalIcon
        , smallIcon
        , mediumIcon
        , largeIcon
        )

{-| Bulma is compatible with Font Awesome icons.

Make sure to include [Font Awesome](http://fontawesome.io/).

@docs Icon, IconSize, icon, normalIcon, smallIcon, mediumIcon, largeIcon
-}

import Html exposing (..)
import Html.Attributes exposing (class)
import String


{-| Icon types
The icon tags are named in the same way as Font Awesome but in TitleCase and
without the `fa` prefix.

E.g. `fa-shopping-cart` is named `IconShoppingCart`.
-}
type Icon
    = IconUsd
    | IconLock
    | IconShoppingCart
    | IconTimes


{-| Size of the icon
-}
type IconSize
    = IconSmall
    | IconNormal
    | IconMedium
    | IconLarge


{-| Creates a normal icon
-}
normalIcon : Icon -> List (Attribute msg) -> Html msg
normalIcon anIcon attributes =
    icon IconNormal anIcon attributes


{-| Creates a small icon
-}
smallIcon : Icon -> List (Attribute msg) -> Html msg
smallIcon anIcon attributes =
    icon IconSmall anIcon attributes


{-| Creates a small icon
-}
mediumIcon : Icon -> List (Attribute msg) -> Html msg
mediumIcon anIcon attributes =
    icon IconMedium anIcon attributes


{-| Creates a small icon
-}
largeIcon : Icon -> List (Attribute msg) -> Html msg
largeIcon anIcon attributes =
    icon IconLarge anIcon attributes


{-| Creates an icon
The base function for creating icons. E.g.

    icon IconSmall IconShoppingCart []
-}
icon : IconSize -> Icon -> List (Attribute msg) -> Html msg
icon size anIcon attributes =
    span [ sizeClass size ]
        [ i [ iconClass anIcon ] []
        ]


sizeClass : IconSize -> Attribute msg
sizeClass size =
    let
        classString =
            case size of
                IconSmall ->
                    "is-small"

                IconNormal ->
                    ""

                IconMedium ->
                    "is-medium"

                IconLarge ->
                    "is-large"
    in
        class ("icon " ++ classString)


iconClass : Icon -> Attribute msg
iconClass anIcon =
    let
        classString =
            case anIcon of
                IconUsd ->
                    "usd"

                IconLock ->
                    "lock"

                IconShoppingCart ->
                    "shopping-cart"

                IconTimes ->
                    "times"
    in
        class ("fa fa-" ++ classString)
