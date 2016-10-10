module Bulma.Notifications exposing (notification, NotificationType(..))

{-| Bold notification blocks, to alert your users of something.

@docs notification
-}

import Html exposing (..)
import Html.Attributes exposing (class)
import String


type NotificationType
    = NotificationDefault
    | NotificationPrimary
    | NotificationInfo
    | NotificationSuccess
    | NotificationWarning
    | NotificationDanger


{-| Create notification
-}
notification : NotificationType -> List (Attribute msg) -> List (Attribute msg) -> List (Html msg) -> Html msg
notification aType closeButtonAtrributes attributes children =
    div ((notificationClass aType) :: attributes)
        ((button (class "delete" :: closeButtonAtrributes) [])
            :: children
        )


notificationClass : NotificationType -> Attribute msg
notificationClass aType =
    let
        typeClass =
            case aType of
                NotificationDefault ->
                    ""

                NotificationPrimary ->
                    "is-primary"

                NotificationInfo ->
                    "is-info"

                NotificationSuccess ->
                    "is-success"

                NotificationWarning ->
                    "is-warning"

                NotificationDanger ->
                    "is-danger"
    in
        class ("notification " ++ typeClass)
