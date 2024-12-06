import gleam/option.{None, Some}
import gleeunit
import gleeunit/should
import zipnotic.{
  pop, strict_zip_2, strict_zip_3, strict_zip_4, unzip_2, unzip_3, unzip_4,
  unzip_longest_2, unzip_longest_3, unzip_longest_4, zip_2, zip_3, zip_4,
  zip_longest_2, zip_longest_3, zip_longest_4,
}

pub fn main() {
  gleeunit.main()
}

pub fn zip_longest_2_test() {
  [1]
  |> zip_longest_2(["a", "b"])
  |> should.equal([#(Some(1), Some("a")), #(None, Some("b"))])

  [1, 2]
  |> zip_longest_2(["a"])
  |> should.equal([#(Some(1), Some("a")), #(Some(2), None)])
}

pub fn unzip_longest_2_test() {
  [#(Some(1), Some("a")), #(None, Some("b"))]
  |> unzip_longest_2
  |> should.equal(#([1], ["a", "b"]))

  [#(Some(1), Some("a")), #(Some(2), None)]
  |> unzip_longest_2
  |> should.equal(#([1, 2], ["a"]))
}

pub fn zip_2_test() {
  [1]
  |> zip_2(["a", "b"])
  |> should.equal([#(1, "a")])

  [1, 2]
  |> zip_2(["a"])
  |> should.equal([#(1, "a")])
}

pub fn unzip_2_test() {
  [#(1, "a"), #(2, "b")] |> unzip_2 |> should.equal(#([1, 2], ["a", "b"]))
}

pub fn strict_zip_2_test() {
  [1]
  |> strict_zip_2(["a", "b"])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_2(["a"])
  |> should.equal(Error(Nil))

  [1]
  |> strict_zip_2(["a"])
  |> should.equal(Ok([#(1, "a")]))
}

pub fn zip_longest_3_test() {
  [1]
  |> zip_longest_3(["a", "b"], [1.2, 0.1])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2)),
    #(None, Some("b"), Some(0.1)),
  ])

  [1, 2]
  |> zip_longest_3(["a"], [1.2, 0.1])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2)),
    #(Some(2), None, Some(0.1)),
  ])

  [1, 2]
  |> zip_longest_3(["a", "b"], [1.2])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2)),
    #(Some(2), Some("b"), None),
  ])
}

pub fn unzip_longest_3_test() {
  [#(Some(1), Some("a"), Some(1.2)), #(None, Some("b"), Some(2.3))]
  |> unzip_longest_3
  |> should.equal(#([1], ["a", "b"], [1.2, 2.3]))

  [#(Some(1), Some("a"), Some(1.2)), #(Some(2), None, Some(2.3))]
  |> unzip_longest_3
  |> should.equal(#([1, 2], ["a"], [1.2, 2.3]))

  [#(Some(1), Some("a"), Some(1.2)), #(Some(2), Some("b"), None)]
  |> unzip_longest_3
  |> should.equal(#([1, 2], ["a", "b"], [1.2]))
}

pub fn zip_3_test() {
  [1]
  |> zip_3(["a", "b"], [1.2, 0.1])
  |> should.equal([#(1, "a", 1.2)])

  [1, 2]
  |> zip_3(["a"], [1.2, 0.1])
  |> should.equal([#(1, "a", 1.2)])

  [1, 2]
  |> zip_3(["a", "b"], [1.2])
  |> should.equal([#(1, "a", 1.2)])
}

pub fn unzip_3_test() {
  [#(1, "a", 1.2), #(2, "b", 2.3)]
  |> unzip_3
  |> should.equal(#([1, 2], ["a", "b"], [1.2, 2.3]))
}

pub fn strict_zip_3_test() {
  [1]
  |> strict_zip_3(["a", "b"], [1.2, 0.1])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_3(["a"], [1.2, 0.1])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_3(["a", "b"], [1.2])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_3(["a", "b"], [1.2, 0.1])
  |> should.equal(Ok([#(1, "a", 1.2), #(2, "b", 0.1)]))
}

pub fn zip_longest_4_test() {
  [1]
  |> zip_longest_4(["a", "b"], [1.2, 0.1], [True, False])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(None, Some("b"), Some(0.1), Some(False)),
  ])
  [1, 2]
  |> zip_longest_4(["a"], [1.2, 0.1], [True, False])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(Some(2), None, Some(0.1), Some(False)),
  ])

  [1, 2]
  |> zip_longest_4(["a", "b"], [1.2], [True, False])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(Some(2), Some("b"), None, Some(False)),
  ])

  [1, 2]
  |> zip_longest_4(["a", "b"], [1.2, 0.1], [True])
  |> should.equal([
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(Some(2), Some("b"), Some(0.1), None),
  ])
}

pub fn unzip_longest_4_test() {
  [
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(None, Some("b"), Some(2.3), Some(False)),
  ]
  |> unzip_longest_4
  |> should.equal(#([1], ["a", "b"], [1.2, 2.3], [True, False]))

  [
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(Some(2), None, Some(2.3), Some(False)),
  ]
  |> unzip_longest_4
  |> should.equal(#([1, 2], ["a"], [1.2, 2.3], [True, False]))

  [
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(Some(2), Some("b"), None, Some(False)),
  ]
  |> unzip_longest_4
  |> should.equal(#([1, 2], ["a", "b"], [1.2], [True, False]))

  [
    #(Some(1), Some("a"), Some(1.2), Some(True)),
    #(Some(2), Some("b"), Some(2.3), None),
  ]
  |> unzip_longest_4
  |> should.equal(#([1, 2], ["a", "b"], [1.2, 2.3], [True]))
}

pub fn zip_4_test() {
  [1]
  |> zip_4(["a", "b"], [1.2, 0.1], [True, False])
  |> should.equal([#(1, "a", 1.2, True)])

  [1, 2]
  |> zip_4(["a"], [1.2, 0.1], [True, False])
  |> should.equal([#(1, "a", 1.2, True)])

  [1, 2]
  |> zip_4(["a", "b"], [1.2], [True, False])
  |> should.equal([#(1, "a", 1.2, True)])

  [1, 2]
  |> zip_4(["a", "b"], [1.2, 0.1], [True])
  |> should.equal([#(1, "a", 1.2, True)])
}

pub fn unzip_4_test() {
  [#(1, "a", 1.2, True), #(2, "b", 2.3, False)]
  |> unzip_4
  |> should.equal(#([1, 2], ["a", "b"], [1.2, 2.3], [True, False]))
}

pub fn strict_zip_4_test() {
  [1]
  |> strict_zip_4(["a", "b"], [1.2, 0.1], [True, False])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_4(["a"], [1.2, 0.1], [True, False])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_4(["a", "b"], [1.2], [True, False])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_4(["a", "b"], [1.2, 0.1], [True])
  |> should.equal(Error(Nil))

  [1, 2]
  |> strict_zip_4(["a", "b"], [1.2, 0.1], [True, False])
  |> should.equal(Ok([#(1, "a", 1.2, True), #(2, "b", 0.1, False)]))
}

pub fn pop_test() {
  [] |> pop |> should.equal(#(None, []))
  [1] |> pop |> should.equal(#(Some(1), []))
  [1, 2] |> pop |> should.equal(#(Some(1), [2]))
}
