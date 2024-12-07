# zipnotic

[![Package Version](https://img.shields.io/hexpm/v/zipnotic)](https://hex.pm/packages/zipnotic)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/zipnotic/)

A grab bag of zip functions.

## Installation

```sh
gleam add zipnotic
```

## Usage

```gleam
import gleam/io
import zipnotic

pub fn main() {
  zipnotic.zip_longest_2([1], ["a", "b"]) |> io.debug
  // [#(Some(1), Some("a")), #(None, Some("b"))]

  zipnotic.zip_2([1, 2], ["a"]) |> io.debug
  // [#(1, "a")]

  zipnotic.strict_zip_2([1], ["a"]) |> io.debug
  // Ok([#(1, "a")])

  zipnotic.strict_zip_2([1, 2], ["a"]) |> io.debug
  // Error(Nil)

  zipnotic.zip_longest_3([1], ["a", "b"], [True]) |> io.debug
  // [#(Some(1), Some("a"), Some(True)), #(None, Some("b"), None)]

  zipnotic.zip_3([1], ["a", "b"], [1.0, 1.1]) |> io.debug
  // [#(1, "a", 1.0)]

  zipnotic.strict_zip_3([1], ["a"], [1.0]) |> io.debug
  // Ok([#(1, "a", 1.0)])

  zipnotic.strict_zip_3([1, 2], ["a"], [1.0]) |> io.debug
  // Error(Nil)

  zipnotic.zip_longest_4([1], ["a", "b"], [1.0], [True, False]) |> io.debug
  // [#(Some(1), Some("a"), Some(1.0), Some(True)), #(None, Some("b"), None, Some(False))]

  zipnotic.zip_4([1], ["a", "b"], [1.0], [True, False]) |> io.debug
  // [#(1, "a", 1.0, True)]

  zipnotic.strict_zip_4([1], ["a"], [1.0], [True]) |> io.debug
  // Ok([#(1, "a", 1.0, True)])

  zipnotic.strict_zip_4([1, 2], ["a"], [1.0], [True]) |> io.debug
  // Error(Nil)
}
```
