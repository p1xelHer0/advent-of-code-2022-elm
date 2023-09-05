module Day1.Main exposing (main)

import Day1.Input exposing (input)
import Html exposing (Html, div, text)


toIntDefaultZero : String -> Int
toIntDefaultZero s =
    Maybe.withDefault 0 (String.toInt s)


caloriesOfInventory : String -> Int
caloriesOfInventory s =
    s |> String.trim |> String.lines |> List.map toIntDefaultZero |> List.sum


main : Html msg
main =
    let
        calories =
            input
                |> String.split "\n\n"
                |> List.map caloriesOfInventory
                |> List.sort
                |> List.reverse
    in
    let
        part1 =
            calories
                -- List.take 1 |> List.sum ?
                |> List.head
                |> Maybe.withDefault 0
    in
    let
        part2 =
            calories |> List.take 3 |> List.sum
    in
    div []
        [ div [] [ text (String.concat [ "Part 1: ", String.fromInt part1 ]) ]
        , div [] [ text (String.concat [ "Part 2: ", String.fromInt part2 ]) ]
        ]
