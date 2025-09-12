import gleam/option.{None, Some}
import gleeunit
import zipnotic.{
  pop, strict_zip_2, strict_zip_3, strict_zip_4, unzip_2, unzip_3, unzip_4,
  unzip_longest_2, unzip_longest_3, unzip_longest_4, zip_2, zip_3, zip_4,
  zip_longest_2, zip_longest_3, zip_longest_4,
}

pub fn main() {
  gleeunit.main()
}

pub fn zip_longest_2_test() {
  assert zip_longest_2([1], ["a", "b"])
    == [#(Some(1), Some("a")), #(None, Some("b"))]

  assert zip_longest_2([1, 2], ["a"])
    == [#(Some(1), Some("a")), #(Some(2), None)]
}

pub fn unzip_longest_2_test() {
  assert unzip_longest_2([#(Some(1), Some("a")), #(None, Some("b"))])
    == #([1], ["a", "b"])

  assert unzip_longest_2([#(Some(1), Some("a")), #(Some(2), None)])
    == #([1, 2], ["a"])
}

pub fn zip_2_test() {
  assert zip_2([1], ["a", "b"]) == [#(1, "a")]

  assert zip_2([1, 2], ["a"]) == [#(1, "a")]
}

pub fn unzip_2_test() {
  assert unzip_2([#(1, "a"), #(2, "b")]) == #([1, 2], ["a", "b"])
}

pub fn strict_zip_2_test() {
  assert strict_zip_2([1], ["a", "b"]) == Error(Nil)

  assert strict_zip_2([1, 2], ["a"]) == Error(Nil)

  assert strict_zip_2([1], ["a"]) == Ok([#(1, "a")])
}

pub fn zip_longest_3_test() {
  assert zip_longest_3([1], ["a", "b"], [1.2, 0.1])
    == [
      #(Some(1), Some("a"), Some(1.2)),
      #(None, Some("b"), Some(0.1)),
    ]

  assert zip_longest_3([1, 2], ["a"], [1.2, 0.1])
    == [
      #(Some(1), Some("a"), Some(1.2)),
      #(Some(2), None, Some(0.1)),
    ]

  assert zip_longest_3([1, 2], ["a", "b"], [1.2])
    == [
      #(Some(1), Some("a"), Some(1.2)),
      #(Some(2), Some("b"), None),
    ]
}

pub fn unzip_longest_3_test() {
  assert unzip_longest_3([
      #(Some(1), Some("a"), Some(1.2)),
      #(None, Some("b"), Some(2.3)),
    ])
    == #([1], ["a", "b"], [1.2, 2.3])

  assert unzip_longest_3([
      #(Some(1), Some("a"), Some(1.2)),
      #(Some(2), None, Some(2.3)),
    ])
    == #([1, 2], ["a"], [1.2, 2.3])

  assert unzip_longest_3([
      #(Some(1), Some("a"), Some(1.2)),
      #(Some(2), Some("b"), None),
    ])
    == #([1, 2], ["a", "b"], [1.2])
}

pub fn zip_3_test() {
  assert zip_3([1], ["a", "b"], [1.2, 0.1]) == [#(1, "a", 1.2)]

  assert zip_3([1, 2], ["a"], [1.2, 0.1]) == [#(1, "a", 1.2)]

  assert zip_3([1, 2], ["a", "b"], [1.2]) == [#(1, "a", 1.2)]
}

pub fn unzip_3_test() {
  assert unzip_3([#(1, "a", 1.2), #(2, "b", 2.3)])
    == #([1, 2], ["a", "b"], [1.2, 2.3])
}

pub fn strict_zip_3_test() {
  assert strict_zip_3([1], ["a", "b"], [1.2, 0.1]) == Error(Nil)

  assert strict_zip_3([1, 2], ["a"], [1.2, 0.1]) == Error(Nil)

  assert strict_zip_3([1, 2], ["a", "b"], [1.2]) == Error(Nil)

  assert strict_zip_3([1, 2], ["a", "b"], [1.2, 0.1])
    == Ok([#(1, "a", 1.2), #(2, "b", 0.1)])
}

pub fn zip_longest_4_test() {
  assert zip_longest_4([1], ["a", "b"], [1.2, 0.1], [True, False])
    == [
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(None, Some("b"), Some(0.1), Some(False)),
    ]
  assert zip_longest_4([1, 2], ["a"], [1.2, 0.1], [True, False])
    == [
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(Some(2), None, Some(0.1), Some(False)),
    ]

  assert zip_longest_4([1, 2], ["a", "b"], [1.2], [True, False])
    == [
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(Some(2), Some("b"), None, Some(False)),
    ]

  assert zip_longest_4([1, 2], ["a", "b"], [1.2, 0.1], [True])
    == [
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(Some(2), Some("b"), Some(0.1), None),
    ]
}

pub fn unzip_longest_4_test() {
  assert unzip_longest_4([
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(None, Some("b"), Some(2.3), Some(False)),
    ])
    == #([1], ["a", "b"], [1.2, 2.3], [True, False])

  assert unzip_longest_4([
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(Some(2), None, Some(2.3), Some(False)),
    ])
    == #([1, 2], ["a"], [1.2, 2.3], [True, False])

  assert unzip_longest_4([
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(Some(2), Some("b"), None, Some(False)),
    ])
    == #([1, 2], ["a", "b"], [1.2], [True, False])

  assert unzip_longest_4([
      #(Some(1), Some("a"), Some(1.2), Some(True)),
      #(Some(2), Some("b"), Some(2.3), None),
    ])
    == #([1, 2], ["a", "b"], [1.2, 2.3], [True])
}

pub fn zip_4_test() {
  assert zip_4([1], ["a", "b"], [1.2, 0.1], [True, False])
    == [#(1, "a", 1.2, True)]

  assert zip_4([1, 2], ["a"], [1.2, 0.1], [True, False])
    == [#(1, "a", 1.2, True)]

  assert zip_4([1, 2], ["a", "b"], [1.2], [True, False])
    == [#(1, "a", 1.2, True)]

  assert zip_4([1, 2], ["a", "b"], [1.2, 0.1], [True]) == [#(1, "a", 1.2, True)]
}

pub fn unzip_4_test() {
  assert unzip_4([#(1, "a", 1.2, True), #(2, "b", 2.3, False)])
    == #([1, 2], ["a", "b"], [1.2, 2.3], [True, False])
}

pub fn strict_zip_4_test() {
  assert strict_zip_4([1], ["a", "b"], [1.2, 0.1], [True, False]) == Error(Nil)

  assert strict_zip_4([1, 2], ["a"], [1.2, 0.1], [True, False]) == Error(Nil)

  assert strict_zip_4([1, 2], ["a", "b"], [1.2], [True, False]) == Error(Nil)

  assert strict_zip_4([1, 2], ["a", "b"], [1.2, 0.1], [True]) == Error(Nil)

  assert strict_zip_4([1, 2], ["a", "b"], [1.2, 0.1], [True, False])
    == Ok([#(1, "a", 1.2, True), #(2, "b", 0.1, False)])
}

pub fn pop_test() {
  assert pop([]) == #(None, [])
  assert pop([1]) == #(Some(1), [])
  assert pop([1, 2]) == #(Some(1), [2])
}
