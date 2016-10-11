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
    = IconAdjust
    | IconAdn
    | IconAlignCenter
    | IconAlignJustify
    | IconAlignLeft
    | IconAlignRight
    | IconAmbulance
    | IconAnchor
    | IconAndroid
    | IconAngellist
    | IconAngleDoubleDown
    | IconAngleDoubleLeft
    | IconAngleDoubleRight
    | IconAngleDoubleUp
    | IconAngleDown
    | IconAngleLeft
    | IconAngleRight
    | IconAngleUp
    | IconApple
    | IconArchive
    | IconAreaChart
    | IconArrowCircleDown
    | IconArrowCircleLeft
    | IconArrowCircleODown
    | IconArrowCircleOLeft
    | IconArrowCircleORight
    | IconArrowCircleOUp
    | IconArrowCircleRight
    | IconArrowCircleUp
    | IconArrowDown
    | IconArrowLeft
    | IconArrowRight
    | IconArrowUp
    | IconArrows
    | IconArrowsAlt
    | IconArrowsH
    | IconArrowsV
    | IconAsterisk
    | IconAt
    | IconAutomobile
    | IconBackward
    | IconBan
    | IconBank
    | IconBarChart
    | IconBarChartO
    | IconBarcode
    | IconBars
    | IconBed
    | IconBeer
    | IconBehance
    | IconBehanceSquare
    | IconBell
    | IconBellO
    | IconBellSlash
    | IconBellSlashO
    | IconBicycle
    | IconBinoculars
    | IconBirthdayCake
    | IconBitbucket
    | IconBitbucketSquare
    | IconBitcoin
    | IconBold
    | IconBolt
    | IconBomb
    | IconBook
    | IconBookmark
    | IconBookmarkO
    | IconBriefcase
    | IconBtc
    | IconBug
    | IconBuilding
    | IconBuildingO
    | IconBullhorn
    | IconBullseye
    | IconBus
    | IconBuysellads
    | IconCab
    | IconCalculator
    | IconCalendar
    | IconCalendarO
    | IconCamera
    | IconCameraRetro
    | IconCar
    | IconCaretDown
    | IconCaretLeft
    | IconCaretRight
    | IconCaretSquareODown
    | IconCaretSquareOLeft
    | IconCaretSquareORight
    | IconCaretSquareOUp
    | IconCaretUp
    | IconCartArrowDown
    | IconCartPlus
    | IconCc
    | IconCcAmex
    | IconCcDiscover
    | IconCcMastercard
    | IconCcPaypal
    | IconCcStripe
    | IconCcVisa
    | IconCertificate
    | IconChain
    | IconChainBroken
    | IconCheck
    | IconCheckCircle
    | IconCheckCircleO
    | IconCheckSquare
    | IconCheckSquareO
    | IconChevronCircleDown
    | IconChevronCircleLeft
    | IconChevronCircleRight
    | IconChevronCircleUp
    | IconChevronDown
    | IconChevronLeft
    | IconChevronRight
    | IconChevronUp
    | IconChild
    | IconCircle
    | IconCircleO
    | IconCircleONotch
    | IconCircleThin
    | IconClipboard
    | IconClockO
    | IconClose
    | IconCloud
    | IconCloudDownload
    | IconCloudUpload
    | IconCny
    | IconCode
    | IconCodeFork
    | IconCodepen
    | IconCoffee
    | IconCog
    | IconCogs
    | IconColumns
    | IconComment
    | IconCommentO
    | IconComments
    | IconCommentsO
    | IconCompass
    | IconCompress
    | IconConnectdevelop
    | IconCopy
    | IconCopyright
    | IconCreditCard
    | IconCrop
    | IconCrosshairs
    | IconCss3
    | IconCube
    | IconCubes
    | IconCut
    | IconCutlery
    | IconDashboard
    | IconDashcube
    | IconDatabase
    | IconDedent
    | IconDelicious
    | IconDesktop
    | IconDeviantart
    | IconDiamond
    | IconDigg
    | IconDollar
    | IconDotCircleO
    | IconDownload
    | IconDribbble
    | IconDropbox
    | IconDrupal
    | IconEdit
    | IconEject
    | IconEllipsisH
    | IconEllipsisV
    | IconEmpire
    | IconEnvelope
    | IconEnvelopeO
    | IconEnvelopeSquare
    | IconEraser
    | IconEur
    | IconEuro
    | IconExchange
    | IconExclamation
    | IconExclamationCircle
    | IconExclamationTriangle
    | IconExpand
    | IconExternalLink
    | IconExternalLinkSquare
    | IconEye
    | IconEyeSlash
    | IconEyedropper
    | IconFacebook
    | IconFacebookF
    | IconFacebookOfficial
    | IconFacebookSquare
    | IconFastBackward
    | IconFastForward
    | IconFax
    | IconFemale
    | IconFighterJet
    | IconFile
    | IconFileArchiveO
    | IconFileAudioO
    | IconFileCodeO
    | IconFileExcelO
    | IconFileImageO
    | IconFileMovieO
    | IconFileO
    | IconFilePdfO
    | IconFilePhotoO
    | IconFilePictureO
    | IconFilePowerpointO
    | IconFileSoundO
    | IconFileText
    | IconFileTextO
    | IconFileVideoO
    | IconFileWordO
    | IconFileZipO
    | IconFilesO
    | IconFilm
    | IconFilter
    | IconFire
    | IconFireExtinguisher
    | IconFlag
    | IconFlagCheckered
    | IconFlagO
    | IconFlash
    | IconFlask
    | IconFlickr
    | IconFloppyO
    | IconFolder
    | IconFolderO
    | IconFolderOpen
    | IconFolderOpenO
    | IconFont
    | IconForumbee
    | IconForward
    | IconFoursquare
    | IconFrownO
    | IconFutbolO
    | IconGamepad
    | IconGavel
    | IconGbp
    | IconGe
    | IconGear
    | IconGears
    | IconGenderless
    | IconGift
    | IconGit
    | IconGitSquare
    | IconGithub
    | IconGithubAlt
    | IconGithubSquare
    | IconGittip
    | IconGlass
    | IconGlobe
    | IconGoogle
    | IconGooglePlus
    | IconGooglePlusSquare
    | IconGoogleWallet
    | IconGraduationCap
    | IconGratipay
    | IconGroup
    | IconHSquare
    | IconHackerNews
    | IconHandODown
    | IconHandOLeft
    | IconHandORight
    | IconHandOUp
    | IconHddO
    | IconHeader
    | IconHeadphones
    | IconHeart
    | IconHeartO
    | IconHeartbeat
    | IconHistory
    | IconHome
    | IconHospitalO
    | IconHotel
    | IconHtml5
    | IconIls
    | IconImage
    | IconInbox
    | IconIndent
    | IconInfo
    | IconInfoCircle
    | IconInr
    | IconInstagram
    | IconInstitution
    | IconIoxhost
    | IconItalic
    | IconJoomla
    | IconJpy
    | IconJsfiddle
    | IconKey
    | IconKeyboardO
    | IconKrw
    | IconLanguage
    | IconLaptop
    | IconLastfm
    | IconLastfmSquare
    | IconLeaf
    | IconLeanpub
    | IconLegal
    | IconLemonO
    | IconLevelDown
    | IconLevelUp
    | IconLifeBouy
    | IconLifeBuoy
    | IconLifeRing
    | IconLifeSaver
    | IconLightbulbO
    | IconLineChart
    | IconLink
    | IconLinkedin
    | IconLinkedinSquare
    | IconLinux
    | IconList
    | IconListAlt
    | IconListOl
    | IconListUl
    | IconLocationArrow
    | IconLock
    | IconLongArrowDown
    | IconLongArrowLeft
    | IconLongArrowRight
    | IconLongArrowUp
    | IconMagic
    | IconMagnet
    | IconMailForward
    | IconMailReply
    | IconMailReplyAll
    | IconMale
    | IconMapMarker
    | IconMars
    | IconMarsDouble
    | IconMarsStroke
    | IconMarsStrokeH
    | IconMarsStrokeV
    | IconMaxcdn
    | IconMeanpath
    | IconMedium'
    | IconMedkit
    | IconMehO
    | IconMercury
    | IconMicrophone
    | IconMicrophoneSlash
    | IconMinus
    | IconMinusCircle
    | IconMinusSquare
    | IconMinusSquareO
    | IconMobile
    | IconMobilePhone
    | IconMoney
    | IconMoonO
    | IconMortarBoard
    | IconMotorcycle
    | IconMusic
    | IconNavicon
    | IconNeuter
    | IconNewspaperO
    | IconOpenid
    | IconOutdent
    | IconPagelines
    | IconPaintBrush
    | IconPaperPlane
    | IconPaperPlaneO
    | IconPaperclip
    | IconParagraph
    | IconPaste
    | IconPause
    | IconPaw
    | IconPaypal
    | IconPencil
    | IconPencilSquare
    | IconPencilSquareO
    | IconPhone
    | IconPhoneSquare
    | IconPhoto
    | IconPictureO
    | IconPieChart
    | IconPiedPiper
    | IconPiedPiperAlt
    | IconPinterest
    | IconPinterestP
    | IconPinterestSquare
    | IconPlane
    | IconPlay
    | IconPlayCircle
    | IconPlayCircleO
    | IconPlug
    | IconPlus
    | IconPlusCircle
    | IconPlusSquare
    | IconPlusSquareO
    | IconPowerOff
    | IconPrint
    | IconPuzzlePiece
    | IconQq
    | IconQrcode
    | IconQuestion
    | IconQuestionCircle
    | IconQuoteLeft
    | IconQuoteRight
    | IconRa
    | IconRandom
    | IconRebel
    | IconRecycle
    | IconReddit
    | IconRedditSquare
    | IconRefresh
    | IconRemove
    | IconRenren
    | IconReorder
    | IconRepeat
    | IconReply
    | IconReplyAll
    | IconRetweet
    | IconRmb
    | IconRoad
    | IconRocket
    | IconRotateLeft
    | IconRotateRight
    | IconRouble
    | IconRss
    | IconRssSquare
    | IconRub
    | IconRuble
    | IconRupee
    | IconSave
    | IconScissors
    | IconSearch
    | IconSearchMinus
    | IconSearchPlus
    | IconSellsy
    | IconSend
    | IconSendO
    | IconServer
    | IconShare
    | IconShareAlt
    | IconShareAltSquare
    | IconShareSquare
    | IconShareSquareO
    | IconShekel
    | IconSheqel
    | IconShield
    | IconShip
    | IconShirtsinbulk
    | IconShoppingCart
    | IconSignIn
    | IconSignOut
    | IconSignal
    | IconSimplybuilt
    | IconSitemap
    | IconSkyatlas
    | IconSkype
    | IconSlack
    | IconSliders
    | IconSlideshare
    | IconSmileO
    | IconSoccerBallO
    | IconSort
    | IconSortAlphaAsc
    | IconSortAlphaDesc
    | IconSortAmountAsc
    | IconSortAmountDesc
    | IconSortAsc
    | IconSortDesc
    | IconSortDown
    | IconSortNumericAsc
    | IconSortNumericDesc
    | IconSortUp
    | IconSoundcloud
    | IconSpaceShuttle
    | IconSpinner
    | IconSpoon
    | IconSpotify
    | IconSquare
    | IconSquareO
    | IconStackExchange
    | IconStackOverflow
    | IconStar
    | IconStarHalf
    | IconStarHalfEmpty
    | IconStarHalfFull
    | IconStarHalfO
    | IconStarO
    | IconSteam
    | IconSteamSquare
    | IconStepBackward
    | IconStepForward
    | IconStethoscope
    | IconStop
    | IconStreetView
    | IconStrikethrough
    | IconStumbleupon
    | IconStumbleuponCircle
    | IconSubscript
    | IconSubway
    | IconSuitcase
    | IconSunO
    | IconSuperscript
    | IconSupport
    | IconTable
    | IconTablet
    | IconTachometer
    | IconTag
    | IconTags
    | IconTasks
    | IconTaxi
    | IconTencentWeibo
    | IconTerminal
    | IconTextHeight
    | IconTextWidth
    | IconTh
    | IconThLarge
    | IconThList
    | IconThumbTack
    | IconThumbsDown
    | IconThumbsODown
    | IconThumbsOUp
    | IconThumbsUp
    | IconTicket
    | IconTimes
    | IconTimesCircle
    | IconTimesCircleO
    | IconTint
    | IconToggleDown
    | IconToggleLeft
    | IconToggleOff
    | IconToggleOn
    | IconToggleRight
    | IconToggleUp
    | IconTrain
    | IconTransgender
    | IconTransgenderAlt
    | IconTrash
    | IconTrashO
    | IconTree
    | IconTrello
    | IconTrophy
    | IconTruck
    | IconTry
    | IconTty
    | IconTumblr
    | IconTumblrSquare
    | IconTurkishLira
    | IconTwitch
    | IconTwitter
    | IconTwitterSquare
    | IconUmbrella
    | IconUnderline
    | IconUndo
    | IconUniversity
    | IconUnlink
    | IconUnlock
    | IconUnlockAlt
    | IconUnsorted
    | IconUpload
    | IconUsd
    | IconUser
    | IconUserMd
    | IconUserPlus
    | IconUserSecret
    | IconUserTimes
    | IconUsers
    | IconVenus
    | IconVenusDouble
    | IconVenusMars
    | IconViacoin
    | IconVideoCamera
    | IconVimeoSquare
    | IconVine
    | IconVk
    | IconVolumeDown
    | IconVolumeOff
    | IconVolumeUp
    | IconWarning
    | IconWechat
    | IconWeibo
    | IconWeixin
    | IconWhatsapp
    | IconWheelchair
    | IconWifi
    | IconWindows
    | IconWon
    | IconWordpress
    | IconWrench
    | IconXing
    | IconXingSquare
    | IconYahoo
    | IconYelp
    | IconYen
    | IconYoutube
    | IconYoutubePlay
    | IconYoutubeSquare


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
                IconAdjust ->
                    "adjust"

                IconAdn ->
                    "adn"

                IconAlignCenter ->
                    "align-center"

                IconAlignJustify ->
                    "align-justify"

                IconAlignLeft ->
                    "align-left"

                IconAlignRight ->
                    "align-right"

                IconAmbulance ->
                    "ambulance"

                IconAnchor ->
                    "anchor"

                IconAndroid ->
                    "android"

                IconAngellist ->
                    "angellist"

                IconAngleDoubleDown ->
                    "angle-double-down"

                IconAngleDoubleLeft ->
                    "angle-double-left"

                IconAngleDoubleRight ->
                    "angle-double-right"

                IconAngleDoubleUp ->
                    "angle-double-up"

                IconAngleDown ->
                    "angle-down"

                IconAngleLeft ->
                    "angle-left"

                IconAngleRight ->
                    "angle-right"

                IconAngleUp ->
                    "angle-up"

                IconApple ->
                    "apple"

                IconArchive ->
                    "archive"

                IconAreaChart ->
                    "area-chart"

                IconArrowCircleDown ->
                    "arrow-circle-down"

                IconArrowCircleLeft ->
                    "arrow-circle-left"

                IconArrowCircleODown ->
                    "arrow-circle-o-down"

                IconArrowCircleOLeft ->
                    "arrow-circle-o-left"

                IconArrowCircleORight ->
                    "arrow-circle-o-right"

                IconArrowCircleOUp ->
                    "arrow-circle-o-up"

                IconArrowCircleRight ->
                    "arrow-circle-right"

                IconArrowCircleUp ->
                    "arrow-circle-up"

                IconArrowDown ->
                    "arrow-down"

                IconArrowLeft ->
                    "arrow-left"

                IconArrowRight ->
                    "arrow-right"

                IconArrowUp ->
                    "arrow-up"

                IconArrows ->
                    "arrows"

                IconArrowsAlt ->
                    "arrows-alt"

                IconArrowsH ->
                    "arrows-h"

                IconArrowsV ->
                    "arrows-v"

                IconAsterisk ->
                    "asterisk"

                IconAt ->
                    "at"

                IconAutomobile ->
                    "automobile"

                IconBackward ->
                    "backward"

                IconBan ->
                    "ban"

                IconBank ->
                    "bank"

                IconBarChart ->
                    "bar-chart"

                IconBarChartO ->
                    "bar-chart-o"

                IconBarcode ->
                    "barcode"

                IconBars ->
                    "bars"

                IconBed ->
                    "bed"

                IconBeer ->
                    "beer"

                IconBehance ->
                    "behance"

                IconBehanceSquare ->
                    "behance-square"

                IconBell ->
                    "bell"

                IconBellO ->
                    "bell-o"

                IconBellSlash ->
                    "bell-slash"

                IconBellSlashO ->
                    "bell-slash-o"

                IconBicycle ->
                    "bicycle"

                IconBinoculars ->
                    "binoculars"

                IconBirthdayCake ->
                    "birthday-cake"

                IconBitbucket ->
                    "bitbucket"

                IconBitbucketSquare ->
                    "bitbucket-square"

                IconBitcoin ->
                    "bitcoin"

                IconBold ->
                    "bold"

                IconBolt ->
                    "bolt"

                IconBomb ->
                    "bomb"

                IconBook ->
                    "book"

                IconBookmark ->
                    "bookmark"

                IconBookmarkO ->
                    "bookmark-o"

                IconBriefcase ->
                    "briefcase"

                IconBtc ->
                    "btc"

                IconBug ->
                    "bug"

                IconBuilding ->
                    "building"

                IconBuildingO ->
                    "building-o"

                IconBullhorn ->
                    "bullhorn"

                IconBullseye ->
                    "bullseye"

                IconBus ->
                    "bus"

                IconBuysellads ->
                    "buysellads"

                IconCab ->
                    "cab"

                IconCalculator ->
                    "calculator"

                IconCalendar ->
                    "calendar"

                IconCalendarO ->
                    "calendar-o"

                IconCamera ->
                    "camera"

                IconCameraRetro ->
                    "camera-retro"

                IconCar ->
                    "car"

                IconCaretDown ->
                    "caret-down"

                IconCaretLeft ->
                    "caret-left"

                IconCaretRight ->
                    "caret-right"

                IconCaretSquareODown ->
                    "caret-square-o-down"

                IconCaretSquareOLeft ->
                    "caret-square-o-left"

                IconCaretSquareORight ->
                    "caret-square-o-right"

                IconCaretSquareOUp ->
                    "caret-square-o-up"

                IconCaretUp ->
                    "caret-up"

                IconCartArrowDown ->
                    "cart-arrow-down"

                IconCartPlus ->
                    "cart-plus"

                IconCc ->
                    "cc"

                IconCcAmex ->
                    "cc-amex"

                IconCcDiscover ->
                    "cc-discover"

                IconCcMastercard ->
                    "cc-mastercard"

                IconCcPaypal ->
                    "cc-paypal"

                IconCcStripe ->
                    "cc-stripe"

                IconCcVisa ->
                    "cc-visa"

                IconCertificate ->
                    "certificate"

                IconChain ->
                    "chain"

                IconChainBroken ->
                    "chain-broken"

                IconCheck ->
                    "check"

                IconCheckCircle ->
                    "check-circle"

                IconCheckCircleO ->
                    "check-circle-o"

                IconCheckSquare ->
                    "check-square"

                IconCheckSquareO ->
                    "check-square-o"

                IconChevronCircleDown ->
                    "chevron-circle-down"

                IconChevronCircleLeft ->
                    "chevron-circle-left"

                IconChevronCircleRight ->
                    "chevron-circle-right"

                IconChevronCircleUp ->
                    "chevron-circle-up"

                IconChevronDown ->
                    "chevron-down"

                IconChevronLeft ->
                    "chevron-left"

                IconChevronRight ->
                    "chevron-right"

                IconChevronUp ->
                    "chevron-up"

                IconChild ->
                    "child"

                IconCircle ->
                    "circle"

                IconCircleO ->
                    "circle-o"

                IconCircleONotch ->
                    "circle-o-notch"

                IconCircleThin ->
                    "circle-thin"

                IconClipboard ->
                    "clipboard"

                IconClockO ->
                    "clock-o"

                IconClose ->
                    "close"

                IconCloud ->
                    "cloud"

                IconCloudDownload ->
                    "cloud-download"

                IconCloudUpload ->
                    "cloud-upload"

                IconCny ->
                    "cny"

                IconCode ->
                    "code"

                IconCodeFork ->
                    "code-fork"

                IconCodepen ->
                    "codepen"

                IconCoffee ->
                    "coffee"

                IconCog ->
                    "cog"

                IconCogs ->
                    "cogs"

                IconColumns ->
                    "columns"

                IconComment ->
                    "comment"

                IconCommentO ->
                    "comment-o"

                IconComments ->
                    "comments"

                IconCommentsO ->
                    "comments-o"

                IconCompass ->
                    "compass"

                IconCompress ->
                    "compress"

                IconConnectdevelop ->
                    "connectdevelop"

                IconCopy ->
                    "copy"

                IconCopyright ->
                    "copyright"

                IconCreditCard ->
                    "credit-card"

                IconCrop ->
                    "crop"

                IconCrosshairs ->
                    "crosshairs"

                IconCss3 ->
                    "css3"

                IconCube ->
                    "cube"

                IconCubes ->
                    "cubes"

                IconCut ->
                    "cut"

                IconCutlery ->
                    "cutlery"

                IconDashboard ->
                    "dashboard"

                IconDashcube ->
                    "dashcube"

                IconDatabase ->
                    "database"

                IconDedent ->
                    "dedent"

                IconDelicious ->
                    "delicious"

                IconDesktop ->
                    "desktop"

                IconDeviantart ->
                    "deviantart"

                IconDiamond ->
                    "diamond"

                IconDigg ->
                    "digg"

                IconDollar ->
                    "dollar"

                IconDotCircleO ->
                    "dot-circle-o"

                IconDownload ->
                    "download"

                IconDribbble ->
                    "dribbble"

                IconDropbox ->
                    "dropbox"

                IconDrupal ->
                    "drupal"

                IconEdit ->
                    "edit"

                IconEject ->
                    "eject"

                IconEllipsisH ->
                    "ellipsis-h"

                IconEllipsisV ->
                    "ellipsis-v"

                IconEmpire ->
                    "empire"

                IconEnvelope ->
                    "envelope"

                IconEnvelopeO ->
                    "envelope-o"

                IconEnvelopeSquare ->
                    "envelope-square"

                IconEraser ->
                    "eraser"

                IconEur ->
                    "eur"

                IconEuro ->
                    "euro"

                IconExchange ->
                    "exchange"

                IconExclamation ->
                    "exclamation"

                IconExclamationCircle ->
                    "exclamation-circle"

                IconExclamationTriangle ->
                    "exclamation-triangle"

                IconExpand ->
                    "expand"

                IconExternalLink ->
                    "external-link"

                IconExternalLinkSquare ->
                    "external-link-square"

                IconEye ->
                    "eye"

                IconEyeSlash ->
                    "eye-slash"

                IconEyedropper ->
                    "eyedropper"

                IconFacebook ->
                    "facebook"

                IconFacebookF ->
                    "facebook-f"

                IconFacebookOfficial ->
                    "facebook-official"

                IconFacebookSquare ->
                    "facebook-square"

                IconFastBackward ->
                    "fast-backward"

                IconFastForward ->
                    "fast-forward"

                IconFax ->
                    "fax"

                IconFemale ->
                    "female"

                IconFighterJet ->
                    "fighter-jet"

                IconFile ->
                    "file"

                IconFileArchiveO ->
                    "file-archive-o"

                IconFileAudioO ->
                    "file-audio-o"

                IconFileCodeO ->
                    "file-code-o"

                IconFileExcelO ->
                    "file-excel-o"

                IconFileImageO ->
                    "file-image-o"

                IconFileMovieO ->
                    "file-movie-o"

                IconFileO ->
                    "file-o"

                IconFilePdfO ->
                    "file-pdf-o"

                IconFilePhotoO ->
                    "file-photo-o"

                IconFilePictureO ->
                    "file-picture-o"

                IconFilePowerpointO ->
                    "file-powerpoint-o"

                IconFileSoundO ->
                    "file-sound-o"

                IconFileText ->
                    "file-text"

                IconFileTextO ->
                    "file-text-o"

                IconFileVideoO ->
                    "file-video-o"

                IconFileWordO ->
                    "file-word-o"

                IconFileZipO ->
                    "file-zip-o"

                IconFilesO ->
                    "files-o"

                IconFilm ->
                    "film"

                IconFilter ->
                    "filter"

                IconFire ->
                    "fire"

                IconFireExtinguisher ->
                    "fire-extinguisher"

                IconFlag ->
                    "flag"

                IconFlagCheckered ->
                    "flag-checkered"

                IconFlagO ->
                    "flag-o"

                IconFlash ->
                    "flash"

                IconFlask ->
                    "flask"

                IconFlickr ->
                    "flickr"

                IconFloppyO ->
                    "floppy-o"

                IconFolder ->
                    "folder"

                IconFolderO ->
                    "folder-o"

                IconFolderOpen ->
                    "folder-open"

                IconFolderOpenO ->
                    "folder-open-o"

                IconFont ->
                    "font"

                IconForumbee ->
                    "forumbee"

                IconForward ->
                    "forward"

                IconFoursquare ->
                    "foursquare"

                IconFrownO ->
                    "frown-o"

                IconFutbolO ->
                    "futbol-o"

                IconGamepad ->
                    "gamepad"

                IconGavel ->
                    "gavel"

                IconGbp ->
                    "gbp"

                IconGe ->
                    "ge"

                IconGear ->
                    "gear"

                IconGears ->
                    "gears"

                IconGenderless ->
                    "genderless"

                IconGift ->
                    "gift"

                IconGit ->
                    "git"

                IconGitSquare ->
                    "git-square"

                IconGithub ->
                    "github"

                IconGithubAlt ->
                    "github-alt"

                IconGithubSquare ->
                    "github-square"

                IconGittip ->
                    "gittip"

                IconGlass ->
                    "glass"

                IconGlobe ->
                    "globe"

                IconGoogle ->
                    "google"

                IconGooglePlus ->
                    "google-plus"

                IconGooglePlusSquare ->
                    "google-plus-square"

                IconGoogleWallet ->
                    "google-wallet"

                IconGraduationCap ->
                    "graduation-cap"

                IconGratipay ->
                    "gratipay"

                IconGroup ->
                    "group"

                IconHSquare ->
                    "h-square"

                IconHackerNews ->
                    "hacker-news"

                IconHandODown ->
                    "hand-o-down"

                IconHandOLeft ->
                    "hand-o-left"

                IconHandORight ->
                    "hand-o-right"

                IconHandOUp ->
                    "hand-o-up"

                IconHddO ->
                    "hdd-o"

                IconHeader ->
                    "header"

                IconHeadphones ->
                    "headphones"

                IconHeart ->
                    "heart"

                IconHeartO ->
                    "heart-o"

                IconHeartbeat ->
                    "heartbeat"

                IconHistory ->
                    "history"

                IconHome ->
                    "home"

                IconHospitalO ->
                    "hospital-o"

                IconHotel ->
                    "hotel"

                IconHtml5 ->
                    "html5"

                IconIls ->
                    "ils"

                IconImage ->
                    "image"

                IconInbox ->
                    "inbox"

                IconIndent ->
                    "indent"

                IconInfo ->
                    "info"

                IconInfoCircle ->
                    "info-circle"

                IconInr ->
                    "inr"

                IconInstagram ->
                    "instagram"

                IconInstitution ->
                    "institution"

                IconIoxhost ->
                    "ioxhost"

                IconItalic ->
                    "italic"

                IconJoomla ->
                    "joomla"

                IconJpy ->
                    "jpy"

                IconJsfiddle ->
                    "jsfiddle"

                IconKey ->
                    "key"

                IconKeyboardO ->
                    "keyboard-o"

                IconKrw ->
                    "krw"

                IconLanguage ->
                    "language"

                IconLaptop ->
                    "laptop"

                IconLastfm ->
                    "lastfm"

                IconLastfmSquare ->
                    "lastfm-square"

                IconLeaf ->
                    "leaf"

                IconLeanpub ->
                    "leanpub"

                IconLegal ->
                    "legal"

                IconLemonO ->
                    "lemon-o"

                IconLevelDown ->
                    "level-down"

                IconLevelUp ->
                    "level-up"

                IconLifeBouy ->
                    "life-bouy"

                IconLifeBuoy ->
                    "life-buoy"

                IconLifeRing ->
                    "life-ring"

                IconLifeSaver ->
                    "life-saver"

                IconLightbulbO ->
                    "lightbulb-o"

                IconLineChart ->
                    "line-chart"

                IconLink ->
                    "link"

                IconLinkedin ->
                    "linkedin"

                IconLinkedinSquare ->
                    "linkedin-square"

                IconLinux ->
                    "linux"

                IconList ->
                    "list"

                IconListAlt ->
                    "list-alt"

                IconListOl ->
                    "list-ol"

                IconListUl ->
                    "list-ul"

                IconLocationArrow ->
                    "location-arrow"

                IconLock ->
                    "lock"

                IconLongArrowDown ->
                    "long-arrow-down"

                IconLongArrowLeft ->
                    "long-arrow-left"

                IconLongArrowRight ->
                    "long-arrow-right"

                IconLongArrowUp ->
                    "long-arrow-up"

                IconMagic ->
                    "magic"

                IconMagnet ->
                    "magnet"

                IconMailForward ->
                    "mail-forward"

                IconMailReply ->
                    "mail-reply"

                IconMailReplyAll ->
                    "mail-reply-all"

                IconMale ->
                    "male"

                IconMapMarker ->
                    "map-marker"

                IconMars ->
                    "mars"

                IconMarsDouble ->
                    "mars-double"

                IconMarsStroke ->
                    "mars-stroke"

                IconMarsStrokeH ->
                    "mars-stroke-h"

                IconMarsStrokeV ->
                    "mars-stroke-v"

                IconMaxcdn ->
                    "maxcdn"

                IconMeanpath ->
                    "meanpath"

                IconMedium' ->
                    "medium"

                IconMedkit ->
                    "medkit"

                IconMehO ->
                    "meh-o"

                IconMercury ->
                    "mercury"

                IconMicrophone ->
                    "microphone"

                IconMicrophoneSlash ->
                    "microphone-slash"

                IconMinus ->
                    "minus"

                IconMinusCircle ->
                    "minus-circle"

                IconMinusSquare ->
                    "minus-square"

                IconMinusSquareO ->
                    "minus-square-o"

                IconMobile ->
                    "mobile"

                IconMobilePhone ->
                    "mobile-phone"

                IconMoney ->
                    "money"

                IconMoonO ->
                    "moon-o"

                IconMortarBoard ->
                    "mortar-board"

                IconMotorcycle ->
                    "motorcycle"

                IconMusic ->
                    "music"

                IconNavicon ->
                    "navicon"

                IconNeuter ->
                    "neuter"

                IconNewspaperO ->
                    "newspaper-o"

                IconOpenid ->
                    "openid"

                IconOutdent ->
                    "outdent"

                IconPagelines ->
                    "pagelines"

                IconPaintBrush ->
                    "paint-brush"

                IconPaperPlane ->
                    "paper-plane"

                IconPaperPlaneO ->
                    "paper-plane-o"

                IconPaperclip ->
                    "paperclip"

                IconParagraph ->
                    "paragraph"

                IconPaste ->
                    "paste"

                IconPause ->
                    "pause"

                IconPaw ->
                    "paw"

                IconPaypal ->
                    "paypal"

                IconPencil ->
                    "pencil"

                IconPencilSquare ->
                    "pencil-square"

                IconPencilSquareO ->
                    "pencil-square-o"

                IconPhone ->
                    "phone"

                IconPhoneSquare ->
                    "phone-square"

                IconPhoto ->
                    "photo"

                IconPictureO ->
                    "picture-o"

                IconPieChart ->
                    "pie-chart"

                IconPiedPiper ->
                    "pied-piper"

                IconPiedPiperAlt ->
                    "pied-piper-alt"

                IconPinterest ->
                    "pinterest"

                IconPinterestP ->
                    "pinterest-p"

                IconPinterestSquare ->
                    "pinterest-square"

                IconPlane ->
                    "plane"

                IconPlay ->
                    "play"

                IconPlayCircle ->
                    "play-circle"

                IconPlayCircleO ->
                    "play-circle-o"

                IconPlug ->
                    "plug"

                IconPlus ->
                    "plus"

                IconPlusCircle ->
                    "plus-circle"

                IconPlusSquare ->
                    "plus-square"

                IconPlusSquareO ->
                    "plus-square-o"

                IconPowerOff ->
                    "power-off"

                IconPrint ->
                    "print"

                IconPuzzlePiece ->
                    "puzzle-piece"

                IconQq ->
                    "qq"

                IconQrcode ->
                    "qrcode"

                IconQuestion ->
                    "question"

                IconQuestionCircle ->
                    "question-circle"

                IconQuoteLeft ->
                    "quote-left"

                IconQuoteRight ->
                    "quote-right"

                IconRa ->
                    "ra"

                IconRandom ->
                    "random"

                IconRebel ->
                    "rebel"

                IconRecycle ->
                    "recycle"

                IconReddit ->
                    "reddit"

                IconRedditSquare ->
                    "reddit-square"

                IconRefresh ->
                    "refresh"

                IconRemove ->
                    "remove"

                IconRenren ->
                    "renren"

                IconReorder ->
                    "reorder"

                IconRepeat ->
                    "repeat"

                IconReply ->
                    "reply"

                IconReplyAll ->
                    "reply-all"

                IconRetweet ->
                    "retweet"

                IconRmb ->
                    "rmb"

                IconRoad ->
                    "road"

                IconRocket ->
                    "rocket"

                IconRotateLeft ->
                    "rotate-left"

                IconRotateRight ->
                    "rotate-right"

                IconRouble ->
                    "rouble"

                IconRss ->
                    "rss"

                IconRssSquare ->
                    "rss-square"

                IconRub ->
                    "rub"

                IconRuble ->
                    "ruble"

                IconRupee ->
                    "rupee"

                IconSave ->
                    "save"

                IconScissors ->
                    "scissors"

                IconSearch ->
                    "search"

                IconSearchMinus ->
                    "search-minus"

                IconSearchPlus ->
                    "search-plus"

                IconSellsy ->
                    "sellsy"

                IconSend ->
                    "send"

                IconSendO ->
                    "send-o"

                IconServer ->
                    "server"

                IconShare ->
                    "share"

                IconShareAlt ->
                    "share-alt"

                IconShareAltSquare ->
                    "share-alt-square"

                IconShareSquare ->
                    "share-square"

                IconShareSquareO ->
                    "share-square-o"

                IconShekel ->
                    "shekel"

                IconSheqel ->
                    "sheqel"

                IconShield ->
                    "shield"

                IconShip ->
                    "ship"

                IconShirtsinbulk ->
                    "shirtsinbulk"

                IconShoppingCart ->
                    "shopping-cart"

                IconSignIn ->
                    "sign-in"

                IconSignOut ->
                    "sign-out"

                IconSignal ->
                    "signal"

                IconSimplybuilt ->
                    "simplybuilt"

                IconSitemap ->
                    "sitemap"

                IconSkyatlas ->
                    "skyatlas"

                IconSkype ->
                    "skype"

                IconSlack ->
                    "slack"

                IconSliders ->
                    "sliders"

                IconSlideshare ->
                    "slideshare"

                IconSmileO ->
                    "smile-o"

                IconSoccerBallO ->
                    "soccer-ball-o"

                IconSort ->
                    "sort"

                IconSortAlphaAsc ->
                    "sort-alpha-asc"

                IconSortAlphaDesc ->
                    "sort-alpha-desc"

                IconSortAmountAsc ->
                    "sort-amount-asc"

                IconSortAmountDesc ->
                    "sort-amount-desc"

                IconSortAsc ->
                    "sort-asc"

                IconSortDesc ->
                    "sort-desc"

                IconSortDown ->
                    "sort-down"

                IconSortNumericAsc ->
                    "sort-numeric-asc"

                IconSortNumericDesc ->
                    "sort-numeric-desc"

                IconSortUp ->
                    "sort-up"

                IconSoundcloud ->
                    "soundcloud"

                IconSpaceShuttle ->
                    "space-shuttle"

                IconSpinner ->
                    "spinner"

                IconSpoon ->
                    "spoon"

                IconSpotify ->
                    "spotify"

                IconSquare ->
                    "square"

                IconSquareO ->
                    "square-o"

                IconStackExchange ->
                    "stack-exchange"

                IconStackOverflow ->
                    "stack-overflow"

                IconStar ->
                    "star"

                IconStarHalf ->
                    "star-half"

                IconStarHalfEmpty ->
                    "star-half-empty"

                IconStarHalfFull ->
                    "star-half-full"

                IconStarHalfO ->
                    "star-half-o"

                IconStarO ->
                    "star-o"

                IconSteam ->
                    "steam"

                IconSteamSquare ->
                    "steam-square"

                IconStepBackward ->
                    "step-backward"

                IconStepForward ->
                    "step-forward"

                IconStethoscope ->
                    "stethoscope"

                IconStop ->
                    "stop"

                IconStreetView ->
                    "street-view"

                IconStrikethrough ->
                    "strikethrough"

                IconStumbleupon ->
                    "stumbleupon"

                IconStumbleuponCircle ->
                    "stumbleupon-circle"

                IconSubscript ->
                    "subscript"

                IconSubway ->
                    "subway"

                IconSuitcase ->
                    "suitcase"

                IconSunO ->
                    "sun-o"

                IconSuperscript ->
                    "superscript"

                IconSupport ->
                    "support"

                IconTable ->
                    "table"

                IconTablet ->
                    "tablet"

                IconTachometer ->
                    "tachometer"

                IconTag ->
                    "tag"

                IconTags ->
                    "tags"

                IconTasks ->
                    "tasks"

                IconTaxi ->
                    "taxi"

                IconTencentWeibo ->
                    "tencent-weibo"

                IconTerminal ->
                    "terminal"

                IconTextHeight ->
                    "text-height"

                IconTextWidth ->
                    "text-width"

                IconTh ->
                    "th"

                IconThLarge ->
                    "th-large"

                IconThList ->
                    "th-list"

                IconThumbTack ->
                    "thumb-tack"

                IconThumbsDown ->
                    "thumbs-down"

                IconThumbsODown ->
                    "thumbs-o-down"

                IconThumbsOUp ->
                    "thumbs-o-up"

                IconThumbsUp ->
                    "thumbs-up"

                IconTicket ->
                    "ticket"

                IconTimes ->
                    "times"

                IconTimesCircle ->
                    "times-circle"

                IconTimesCircleO ->
                    "times-circle-o"

                IconTint ->
                    "tint"

                IconToggleDown ->
                    "toggle-down"

                IconToggleLeft ->
                    "toggle-left"

                IconToggleOff ->
                    "toggle-off"

                IconToggleOn ->
                    "toggle-on"

                IconToggleRight ->
                    "toggle-right"

                IconToggleUp ->
                    "toggle-up"

                IconTrain ->
                    "train"

                IconTransgender ->
                    "transgender"

                IconTransgenderAlt ->
                    "transgender-alt"

                IconTrash ->
                    "trash"

                IconTrashO ->
                    "trash-o"

                IconTree ->
                    "tree"

                IconTrello ->
                    "trello"

                IconTrophy ->
                    "trophy"

                IconTruck ->
                    "truck"

                IconTry ->
                    "try"

                IconTty ->
                    "tty"

                IconTumblr ->
                    "tumblr"

                IconTumblrSquare ->
                    "tumblr-square"

                IconTurkishLira ->
                    "turkish-lira"

                IconTwitch ->
                    "twitch"

                IconTwitter ->
                    "twitter"

                IconTwitterSquare ->
                    "twitter-square"

                IconUmbrella ->
                    "umbrella"

                IconUnderline ->
                    "underline"

                IconUndo ->
                    "undo"

                IconUniversity ->
                    "university"

                IconUnlink ->
                    "unlink"

                IconUnlock ->
                    "unlock"

                IconUnlockAlt ->
                    "unlock-alt"

                IconUnsorted ->
                    "unsorted"

                IconUpload ->
                    "upload"

                IconUsd ->
                    "usd"

                IconUser ->
                    "user"

                IconUserMd ->
                    "user-md"

                IconUserPlus ->
                    "user-plus"

                IconUserSecret ->
                    "user-secret"

                IconUserTimes ->
                    "user-times"

                IconUsers ->
                    "users"

                IconVenus ->
                    "venus"

                IconVenusDouble ->
                    "venus-double"

                IconVenusMars ->
                    "venus-mars"

                IconViacoin ->
                    "viacoin"

                IconVideoCamera ->
                    "video-camera"

                IconVimeoSquare ->
                    "vimeo-square"

                IconVine ->
                    "vine"

                IconVk ->
                    "vk"

                IconVolumeDown ->
                    "volume-down"

                IconVolumeOff ->
                    "volume-off"

                IconVolumeUp ->
                    "volume-up"

                IconWarning ->
                    "warning"

                IconWechat ->
                    "wechat"

                IconWeibo ->
                    "weibo"

                IconWeixin ->
                    "weixin"

                IconWhatsapp ->
                    "whatsapp"

                IconWheelchair ->
                    "wheelchair"

                IconWifi ->
                    "wifi"

                IconWindows ->
                    "windows"

                IconWon ->
                    "won"

                IconWordpress ->
                    "wordpress"

                IconWrench ->
                    "wrench"

                IconXing ->
                    "xing"

                IconXingSquare ->
                    "xing-square"

                IconYahoo ->
                    "yahoo"

                IconYelp ->
                    "yelp"

                IconYen ->
                    "yen"

                IconYoutube ->
                    "youtube"

                IconYoutubePlay ->
                    "youtube-play"

                IconYoutubeSquare ->
                    "youtube-square"
    in
        class ("fa fa-" ++ classString)
