//
//  OptionalExtensions.swift
//  OptionalExtensions
//
//  Created by Rui Peres on 30/12/2015.
//  Copyright © 2015 Rui Peres. All rights reserved.
//

import Foundation

public extension Optional {
    
    func filter(@noescape predicate: Wrapped -> Bool) -> Optional {
        
        return map(predicate) == .Some(true) ? self : .None
    }
    
    func replaceNil(with replacement: Wrapped) -> Optional {
        
        return self ?? replacement
    }
    
    func apply(@noescape f: Wrapped -> Void) {
        
        if let wrapped = self { f(wrapped) }
    }
    
    func onSome(@noescape f: Wrapped -> Void) -> Optional {
        
        apply(f)
        return self
    }
    
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
