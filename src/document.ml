open Containers
open Fun

type paragraph =
  | Plain of string
  | Bullet of string list
  | Number of string list

type item =
  { title : string
  ; location : string
  ; dates : string list
  ; summary : string
  ; content : paragraph list
  }

let environment name s =
  "\\begin{" ^ name ^ "}"
  ^ s
  ^ "\\end{" ^ name ^ "}"

let list_environment name items =
  items
  |> List.map ((^) "\\item ")
  |> String.concat ""
  |> environment name

let paragraph_to_latex =
  function
  | Plain s -> s
  | Bullet ss -> list_environment "itemize" ss
  | Number ss -> list_environment "enumerate" ss

let content_to_latex =
  List.map (paragraph_to_latex %> (^) "\\par ")
  %> String.concat ""

let item_to_latex { title; dates; location; summary; content } =
  "\\paragraph{" ^ title ^ "}"
  ^ "\\dates{" ^ String.concat "/" dates ^ "}"
  ^ "(" ^ location ^ ") "
  ^ summary
  ^ content_to_latex content
