# OptionalExtensions

<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
[![Swift 2.1](https://img.shields.io/badge/Swift-2.1-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://opensource.org/licenses/MIT)


Why?
----

Swift's Optional is pretty awesome, but it can always get better. This repository is an humble attempt to add some utility methods to it.

####`filter`

```swift
let number: Int? = 3

let biggerThan2 = number.filter { $0 > 2 } // .Some(3)


let biggerThan3 = number.filter { $0 > 3 } // .None
```

####`replaceNil`

```swift
let number: Int? = 3
number.replaceNil(with: 2) // .Some(3)

let nilledNumber: Int? = nil
nilledNumber.replaceNil(with: 2) // .Some(2)
```

####`apply` (similar to `[T]`'s `forEach`)

```swift
let number: Int? = 3
number.apply { print($0) } // prints "3"

let nilledNumber: Int? = nil
nilledNumber.apply { print($0) } // print won't be called
```

####`onSome` (injects a side effect in the `.Some` branch)

```swift
let number: Int? = 3
let sameNumber = number.onSome { print($0) } // prints "3" & returns .Optional(3)

let nilledNumber: Int? = nil
let sameNilledNumber = nilledNumber.onSome { print($0) } // .None
```

####`onNone` (injects a side effect in the `.None` branch)

```swift
let number: Int? = 3
let sameNumber = number.onNone { print("Hello World") } // .Optional(3)

let nilledNumber: Int? = nil
let sameNilledNumber = nilledNumber.onNone { print("Hello World") } // prints "Hello World" & returns .None
```

####`isSome`

```swift
let number: Int? = 3
let isSome = number.isSome // true

let nilledNumber: Int? = nil
let isSome = nilledNumber.isSome // false
```

####`isNone`

```swift
let number: Int? = 3
let isSome = number.isNone // false

let nilledNumber: Int? = nil
let isSome = nilledNumber.isNone // true
```

Setup
-----

Carthage:

```
github "RuiAAPeres/OptionalExtensions"
```

License
-------

OptionalExtensions is licensed under the MIT License, Version 2.0. [View the license file](LICENSE)

Copyright (c) 2015 Rui Peres
