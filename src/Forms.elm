module Forms exposing (..)

import Browser
import Buttons exposing (Model, Msg)
import Char exposing (isDigit, isLower, isUpper)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import List exposing (filter, isEmpty)
import String exposing (toList)



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
    { name : String
    , password : String
    , passwordAgain : String
    }


init : Model
init =
    Model "" "" ""



-- UPDATE


type Msg
    = Name String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Password password ->
            { model | password = password }

        PasswordAgain passwordAgain ->
            { model | passwordAgain = passwordAgain }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ viewInput "text" "Name" model.name Name
        , viewInput "password" "Password" model.password Password
        , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
        , viewValidation model
        , lengthConfirm model
        , complexConfirm model
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


viewValidation : Model -> Html msg
viewValidation model =
    if model.password == model.passwordAgain then
        div [ style "color" "green" ] [ text "OK" ]

    else
        div [ style "color" "red" ] [ text "Passwords do not match!" ]


lengthConfirm : Model -> Html msg
lengthConfirm model =
    if String.length model.password > 8 then
        div [ style "color" "green" ] [ text "The length is long enough." ]

    else
        div [ style "color" "red" ] [ text "The length must be longer than 8 characters." ]


complexConfirm : Model -> Html msg
complexConfirm model =
    if
        isEmpty (filter isUpper (toList model.password))
            || isEmpty (filter isLower (toList model.password))
            || isEmpty (filter isDigit (toList model.password))
    then
        div [ style "color" "red" ] [ text "The password must contain upper case, lower case, and numeric characters." ]

    else
        div [ style "color" "green" ] [ text "The password is complex enough." ]
