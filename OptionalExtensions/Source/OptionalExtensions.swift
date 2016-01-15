//
//  OptionalExtensions.swift
//  OptionalExtensions
//
//  Created by Rui Peres on 30/12/2015.
//  Copyright © 2015 Rui Peres. All rights reserved.
//

public extension Optional {

    @warn_unused_result
    func filter(@noescape predicate: Wrapped -> Bool) -> Optional {

        return map(predicate) == .Some(true) ? self : .None
    }

    @warn_unused_result
    func replaceNil(with replacement: Wrapped) -> Optional {

        return self ?? replacement
    }

    func then(@noescape f: Wrapped -> Void) {

        if let wrapped = self { f(wrapped) }
    }
    
    @warn_unused_result
    func maybe<U>(defaultValue: U, @noescape f: Wrapped -> U) -> U {
        
        return map(f) ?? defaultValue
    }

    @warn_unused_result
    func onSome(@noescape f: Wrapped -> Void) -> Optional {

        then(f)
        return self
    }

    @warn_unused_result
    func onNone(@noescape f: Void -> Void) -> Optional {

        if isNone { f() }
        return self
    }

    var isSome: Bool {

        return self != nil
    }

        var isNone: Bool {

        return !isSome
    }
}
