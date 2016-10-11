module Bulma.Icons
    exposing
        ( Icon(..)
        , icon
        , normalIcon
        , smallIcon
        , mediumIcon
        , largeIcon
        )

{-| Bulma is compatible with Font Awesome icons.

Make sure to include [Font Awesome](http://fontawesome.io/).

@docs Icon, icon, normalIcon, smallIcon, mediumIcon, largeIcon
-}

import Html exposing (..)
import Html.Attributes exposing (class)
import String


{-| Icon type
-}
type Icon
    = IconSmall
    | IconNormal
    | IconMedium
    | IconLarge


{-| Creates a normal icon
-}
normalIcon : String -> List (Attribute msg) -> Html msg
normalIcon anIcon attributes =
    icon IconNormal anIcon attributes


{-| Creates a small icon
-}
smallIcon : String -> List (Attribute msg) -> Html msg
smallIcon anIcon attributes =
    icon IconSmall anIcon attributes


{-| Creates a small icon
-}
mediumIcon : String -> List (Attribute msg) -> Html msg
mediumIcon anIcon attributes =
    icon IconMedium anIcon attributes


{-| Creates a small icon
-}
largeIcon : String -> List (Attribute msg) -> Html msg
largeIcon anIcon attributes =
    icon IconLarge anIcon attributes


{-| Creates an icon
The base function for creating icons. E.g.

    icon IconSmall IconShoppingCart []
-}
icon : Icon -> String -> List (Attribute msg) -> Html msg
icon size anIcon attributes =
    span [ sizeClass size ]
        [ i [ iconClass anIcon ] []
        ]


sizeClass : Icon -> Attribute msg
sizeClass size =
    let
        sizeString =
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
        class ("icon " ++ sizeString)


iconClass : String -> Attribute msg
iconClass anIcon =
    class ("fa fa-" ++ anIcon)
