module Bulma.Icons
    exposing
        ( Icon(..)
        , IconSize(..)
        , icn
        )

{-| Icons wrapper. Bulma.io uses Font Awesome icons.

@docs Icon, IconSize, icn
-}

import Html exposing (..)
import Html.Attributes exposing (class)
import String


{-| Icon types
-}
type Icon
    = IconUsd
    | IconLock
    | IconShoppingCart
    | IconTimes


{-| Size of the icon
-}
type IconSize
    = IconSmall Icon
    | IconNormal Icon
    | IconMedium Icon
    | IconLarge Icon


{-| Creates icon
-}
icn : IconSize -> List (Attribute msg) -> Html msg
icn icon' attributes =
    let
        iconClasses =
            case icon' of
                IconSmall anIcon ->
                    ( "is-small", iconClass anIcon )

                IconNormal anIcon ->
                    ( "", iconClass anIcon )

                IconMedium anIcon ->
                    ( "is-medium", iconClass anIcon )

                IconLarge anIcon ->
                    ( "is-large", iconClass anIcon )
    in
        span [ class (String.join " " [ "icon", fst iconClasses ]) ]
            [ i [ snd iconClasses ] []
            ]


iconClass : Icon -> Attribute msg
iconClass icon' =
    let
        classString =
            case icon' of
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
