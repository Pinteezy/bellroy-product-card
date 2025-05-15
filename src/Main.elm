module Main exposing (..)

import Browser
import Html exposing (Html)
import ProductCard exposing (Model, Msg, init, update, view)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
