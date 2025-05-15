module ProductCard exposing (Model, Msg(..), init, update, view)

import Browser
import Html exposing (Html, div, img, span, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- MODEL

type alias Model =
    { title : String
    , price : String
    , imageUrl : String
    , colorOptions : List String
    , selectedColor : Maybe String
    }

init : Model
init =
    { title = "Slim Sleeve Wallet"
    , price = "$89"
    , imageUrl = "https://images.bellroy.com/image/upload/f_auto,q_auto,w_600/c_scale,dpr_2/v1/product-images/SLIM_SLATE_FRONT1133.png"
    , colorOptions = [ "black", "cocoa", "navy", "green" ]
    , selectedColor = Nothing
    }


-- UPDATE

type Msg
    = SelectColor String

update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectColor color ->
            { model | selectedColor = Just color }


-- VIEW

view : Model -> Html Msg
view model =
    div [ class "product-card", style "width" "250px", style "font-family" "sans-serif" ]
        [ img [ src model.imageUrl, alt model.title, style "width" "100%" ] []
        , div [ style "margin-top" "10px" ]
            [ span [ style "font-weight" "bold" ] [ text model.title ]
            , span [ style "float" "right", style "color" "#555" ] [ text model.price ]
            ]
        , div [ style "margin-top" "10px", style "display" "flex", style "gap" "8px" ]
            (List.map (colorSwatch model.selectedColor) model.colorOptions)
        ]


colorSwatch : Maybe String -> String -> Html Msg
colorSwatch selected color =
    let
        borderStyle =
            case selected of
                Just c ->
                    if c == color then
                        "2px solid #000"
                    else
                        "1px solid #ccc"

                Nothing ->
                    "1px solid #ccc"
    in
    div
        [ style "width" "20px"
        , style "height" "20px"
        , style "border" borderStyle
        , style "border-radius" "50%"
        , style "background-color" color
        , style "cursor" "pointer"
        , onClick (SelectColor color)
        ]
        []

