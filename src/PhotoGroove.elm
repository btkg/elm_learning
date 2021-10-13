module PhotoGroove exposing (..)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)


view : a -> Html.Html msg
view _ =
    div [ class "content" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            [ img [ src "https://elm-in-action.com/1.jpeg" ] []
            , img [ src "https://elm-in-action.com/2.jpeg" ] []
            , img [ src "https://elm-in-action.com/3.jpeg" ] []
            ]
        ]


main : Html.Html msg
main =
    view "no model yet"
