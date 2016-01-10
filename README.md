# OptionalExtensions

![](https://travis-ci.org/RuiAAPeres/OptionalExtensions.svg?branch=master)
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
[![Swift 2.1](https://img.shields.io/badge/Swift-2.1-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://opensource.org/licenses/MIT)
![](https://camo.githubusercontent.com/410f44c161ebf367eacb1fcce9121e336e211bc6/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f506c6174666f726d2d696f732532302537432532306f737825323025374325323077617463686f7325323025374325323074766f732d6c69676874677265792e7376673f7374796c653d666c6174)

Why?
----

Swift's Optional is pretty awesome, but it can always get better. This repository is an humble attempt to add some utility methods to it.

####`Equatable: (T, Optional<T>) -> Bool`

```swift
let number: Int? = 3
let isEqual = number == 3 // true

let nilledNumber: Int? = nil
let isNotEqual = nilledNumber == 3 // false
```

####`filter: (T -> Bool) -> Optional<T>`

```swift
let number: Int? = 3

let biggerThan2 = number.filter { $0 > 2 } // .Some(3)


let biggerThan3 = number.filter { $0 > 3 } // .None
```

####`replaceNil: T -> Optional<T>`

```swift
let number: Int? = 3
number.replaceNil(with: 2) // .Some(3)

let nilledNumber: Int? = nil
nilledNumber.replaceNil(with: 2) // .Some(2)
```

####`then: (T -> Void) -> Void` (similar to `[T]`'s `forEach`)

```swift
let number: Int? = 3
number.then { print($0) } // prints "3"

let nilledNumber: Int? = nil
nilledNumber.then { print($0) } // print won't be called
```

####`maybe: U -> (T -> U) -> U` (similar to Haskell's `maybe`)

```swift
let number: Int? = 3
number.maybe(100) { $0 + 1 } // 4

let nilledNumber: Int? = nil
nilledNumber.maybe(100) { $0 + 1 } // 100
```

####`onSome: (T -> Void) -> Optional<T>` (injects a side effect in the `.Some` branch)

```swift
let number: Int? = 3
let sameNumber = number.onSome { print($0) } // prints "3" & returns .Optional(3)

let nilledNumber: Int? = nil
let sameNilledNumber = nilledNumber.onSome { print($0) } // .None
```

####`onNone: (Void -> Void) -> Optional<T>` (injects a side effect in the `.None` branch)

```swift
let number: Int? = 3
let sameNumber = number.onNone { print("Hello World") } // .Optional(3)

let nilledNumber: Int? = nil
let sameNilledNumber = nilledNumber.onNone { print("Hello World") } // prints "Hello World" & returns .None
```

####`isSome: Bool`

```swift
let number: Int? = 3
let isSome = number.isSome // true

let nilledNumber: Int? = nil
let isSome = nilledNumber.isSome // false
```

####`isNone: Bool`

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

Cocoapods:

```
pod "OptionalExtensions"
```

Contributing
-----------

We will gladly accept Pull Requests with new methods or improving the ones that already exist. Documentation, or tests, are always welcome as well. ❤️

License
-------

OptionalExtensions is licensed under the MIT License, Version 2.0. [View the license file](LICENSE)

Copyright (c) 2015 Rui Peres
