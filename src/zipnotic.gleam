import gleam/list
import gleam/option.{type Option, None, Some}

// -------------------- zip 2

/// Zips two lists into tuples containing optional values. Zipping ends when all
/// lists are exhausted.
///
/// ```gleam
/// zip_longest_2([1], ["a", "b"])
/// // -> [#(Some(1), Some("a")), #(None, Some("b"))]
/// ```
pub fn zip_longest_2(
  list: List(a),
  other: List(b),
) -> List(#(Option(a), Option(b))) {
  do_zip_longest_2(list, other, [])
}

fn do_zip_longest_2(
  list: List(a),
  other: List(b),
  acc: List(#(Option(a), Option(b))),
) -> List(#(Option(a), Option(b))) {
  case pop(list), pop(other) {
    #(None, _), #(None, _) -> acc |> list.reverse
    #(a, a_rest), #(b, b_rest) ->
      do_zip_longest_2(a_rest, b_rest, [#(a, b), ..acc])
  }
}

/// Zips two lists into tuples of values. Zipping ends when the shortest list is
/// exhausted.
///
/// ```gleam
/// zip_2([1, 2], ["a"])
/// // -> [#(1, "a")]
/// ```
pub fn zip_2(list: List(a), other: List(b)) -> List(#(a, b)) {
  list |> list.zip(other)
}

/// Zips two lists into a result. If the lists are all equal in length, a list
/// of tuples is returned within `Ok`. If the lists are not the same length,
/// `Error(Nil)` is returned.
///
/// ```gleam
/// strict_zip_2([1], ["a"])
/// // -> Ok([#(1, "a")])
/// strict_zip_2([1, 2], ["a"])
/// // -> Error(Nil)
/// ```
pub fn strict_zip_2(list: List(a), other: List(b)) -> Result(List(#(a, b)), Nil) {
  list |> list.strict_zip(other)
}

// -------------------- zip 3

/// Zips three lists into tuples containing optional values. Zipping ends when
/// all lists are exhausted.
///
/// ```gleam
/// zip_longest_3([1], ["a", "b"], [True])
/// // -> [#(Some(1), Some("a"), Some(True)), #(None, Some("b"), None)]
/// ```
pub fn zip_longest_3(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
) -> List(#(Option(a), Option(b), Option(c))) {
  do_zip_longest_3(list, other_1, other_2, [])
}

fn do_zip_longest_3(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  acc: List(#(Option(a), Option(b), Option(c))),
) -> List(#(Option(a), Option(b), Option(c))) {
  case pop(list), pop(other_1), pop(other_2) {
    #(None, _), #(None, _), #(None, _) -> acc |> list.reverse
    #(a, a_rest), #(b, b_rest), #(c, c_rest) ->
      do_zip_longest_3(a_rest, b_rest, c_rest, [#(a, b, c), ..acc])
  }
}

/// Zips three lists into tuples of values. Zipping ends when the shortest list
/// is exhausted.
///
/// ```gleam
/// zip_3([1], ["a", "b"], [1.0, 1.1])
/// // -> [#(1, "a", 1.0)]
/// ```
pub fn zip_3(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
) -> List(#(a, b, c)) {
  do_zip_3(list, other_1, other_2, [])
}

fn do_zip_3(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  acc: List(#(a, b, c)),
) -> List(#(a, b, c)) {
  case list, other_1, other_2 {
    [a, ..a_rest], [b, ..b_rest], [c, ..c_rest] ->
      do_zip_3(a_rest, b_rest, c_rest, [#(a, b, c), ..acc])
    _, _, _ -> acc |> list.reverse
  }
}

/// Zips three lists into a result. If the lists are all equal in length, a list
/// of tuples is returned within `Ok`. If the lists are not the same length,
/// `Error(Nil)` is returned.
///
/// ```gleam
/// strict_zip_3([1], ["a"], [1.0])
/// // -> Ok([#(1, "a", 1.0)])
/// strict_zip_3([1, 2], ["a"], [1.0])
/// // -> Error(Nil)
/// ```
pub fn strict_zip_3(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
) -> Result(List(#(a, b, c)), Nil) {
  do_strict_zip_3(list, other_1, other_2, [])
}

fn do_strict_zip_3(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  acc: List(#(a, b, c)),
) -> Result(List(#(a, b, c)), Nil) {
  case list, other_1, other_2 {
    [], [], [] -> Ok(acc |> list.reverse)
    [], _, _ | _, [], _ | _, _, [] -> Error(Nil)
    [a, ..a_rest], [b, ..b_rest], [c, ..c_rest] ->
      do_strict_zip_3(a_rest, b_rest, c_rest, [#(a, b, c), ..acc])
  }
}

// -------------------- zip 4

/// Zips four lists into tuples containing optional values. Zipping ends when
/// all lists are exhausted.
///
/// ```gleam
/// zip_longest_4([1], ["a", "b"], [1.0], [True, False])
/// // -> [#(Some(1), Some("a"), Some(1.0), Some(True)), #(None, Some("b"), None, Some(False))]
/// ```
pub fn zip_longest_4(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  other_3: List(d),
) -> List(#(Option(a), Option(b), Option(c), Option(d))) {
  do_zip_longest_4(list, other_1, other_2, other_3, [])
}

fn do_zip_longest_4(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  other_3: List(d),
  acc: List(#(Option(a), Option(b), Option(c), Option(d))),
) -> List(#(Option(a), Option(b), Option(c), Option(d))) {
  case pop(list), pop(other_1), pop(other_2), pop(other_3) {
    #(None, _), #(None, _), #(None, _), #(None, _) -> acc |> list.reverse
    #(a, a_rest), #(b, b_rest), #(c, c_rest), #(d, d_rest) ->
      do_zip_longest_4(a_rest, b_rest, c_rest, d_rest, [#(a, b, c, d), ..acc])
  }
}

/// Zips four lists into tuples of values. Zipping ends when the shortest list
/// is exhausted.
///
/// ```gleam
/// zip_4([1], ["a", "b"], [1.0], [True, False])
/// // -> [#(1, "a", 1.0, True)]
/// ```
pub fn zip_4(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  other_3: List(d),
) -> List(#(a, b, c, d)) {
  do_zip_4(list, other_1, other_2, other_3, [])
}

fn do_zip_4(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  other_3: List(d),
  acc: List(#(a, b, c, d)),
) -> List(#(a, b, c, d)) {
  case list, other_1, other_2, other_3 {
    [a, ..a_rest], [b, ..b_rest], [c, ..c_rest], [d, ..d_rest] ->
      do_zip_4(a_rest, b_rest, c_rest, d_rest, [#(a, b, c, d), ..acc])
    _, _, _, _ -> acc |> list.reverse
  }
}

/// Zips four lists into a result. If the lists are all equal in length, a list
/// of tuples is returned within `Ok`. If the lists are not the same length,
/// `Error(Nil)` is returned.
///
/// ```gleam
/// strict_zip_4([1], ["a"], [1.0], [True])
/// // -> Ok([#(1, "a", 1.0, True)])
/// strict_zip_4([1, 2], ["a"], [1.0], [True])
/// // -> Error(Nil)
/// ```
pub fn strict_zip_4(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  other_3: List(d),
) -> Result(List(#(a, b, c, d)), Nil) {
  do_strict_zip_4(list, other_1, other_2, other_3, [])
}

fn do_strict_zip_4(
  list: List(a),
  other_1: List(b),
  other_2: List(c),
  other_3: List(d),
  acc: List(#(a, b, c, d)),
) -> Result(List(#(a, b, c, d)), Nil) {
  case list, other_1, other_2, other_3 {
    [], [], [], [] -> Ok(acc |> list.reverse)
    [], _, _, _ | _, [], _, _ | _, _, [], _ | _, _, _, [] -> Error(Nil)
    [a, ..a_rest], [b, ..b_rest], [c, ..c_rest], [d, ..d_rest] ->
      do_strict_zip_4(a_rest, b_rest, c_rest, d_rest, [#(a, b, c, d), ..acc])
  }
}

@internal
pub fn pop(list: List(a)) -> #(Option(a), List(a)) {
  case list {
    [] -> #(None, [])
    [a, ..rest] -> #(Some(a), rest)
  }
}
