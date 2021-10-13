module Text_Fields exposing (..)

import Browser
import Buttons exposing (Model, Msg)
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Debug exposing (toString)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { content : String
    }


init : Model
init =
    { content = "" }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
        , div [] [ text (String.reverse model.content) ]
        , div [] [ text (toString (String.length model.content)) ]
        ]
