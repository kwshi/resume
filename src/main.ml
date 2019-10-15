module Doc = Document

let () =
  Data.mathily
  |> Doc.item_to_latex
  |> print_endline
