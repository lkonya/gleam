module Maybe

export Maybe(..), some?/1, none?/1, map/2, flatten/1, flat_map/2, unwrap/2


type Maybe(x)
  = Just(x)
  | Nothing

let some?(maybe) =
  match maybe
  | Just(_) => True
  | Nothing => False

let none?(maybe) =
  match maybe
  | Just(_) => False
  | Nothing => True

let map(maybe, fun) =
  match maybe
  | Just(x) => fun(x)
  | Nothing => Nothing

let flatten(maybe) =
  maybe
    |> unwrap(_, Nothing)

let flat_map(maybe, fun) =
  maybe
    |> map(_, fun)
    |> flatten

let unwrap(maybe, fallback) =
  match maybe
  | Just(v) => v
  | Nothing => fallback