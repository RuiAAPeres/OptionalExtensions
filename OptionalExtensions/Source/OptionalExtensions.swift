//
//  OptionalExtensions.swift
//  OptionalExtensions
//
//  Created by Rui Peres on 30/12/2015.
//  Copyright © 2015 Rui Peres. All rights reserved.
//

public extension Optional {
    
    func filter(_ predicate: @noescape (Wrapped) -> Bool) -> Optional {

        return map(predicate) == .some(true) ? self : .none
    }

    func mapNil(_ predicate: @noescape (Void) -> Wrapped) -> Optional {

        return self ?? .some(predicate())
    }
    
    func flatMapNil(_ predicate: @noescape (Void) -> Optional) -> Optional {
        
        return self ?? predicate()
    }

    func then(_ f: @noescape (Wrapped) -> Void) {

        if let wrapped = self { f(wrapped) }
    }
    
    
    func maybe<U>(_ defaultValue: U, f: @noescape (Wrapped) -> U) -> U {
        
        return map(f) ?? defaultValue
    }

    func onSome(_ f: @noescape (Wrapped) -> Void) -> Optional {

        then(f)
        return self
    }

    func onNone(_ f: @noescape (Void) -> Void) -> Optional {

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
