//
//  OptionalExtensions.swift
//  OptionalExtensions
//
//  Created by Rui Peres on 30/12/2015.
//  Copyright © 2015 Rui Peres. All rights reserved.
//

import Foundation

extension Optional {
    
    func filter(predicate: Wrapped -> Bool) -> Optional {
        
        guard let result = self.map (predicate) where result == true else { return .None}
        return self
    }
    
    func replace(replacement: Wrapped) -> Optional {
        
        switch self {
        case .Some(_): return self
        case .None: return .Some(replacement)
        }
    }
    
    func apply(f: Wrapped -> Void) {
        
        switch self {
        case .Some(let wrapped): f(wrapped)
        default: break
        }
    }
    
    func onSome(f: Wrapped -> Void) -> Optional {
        
        switch self {
        case .Some(let wrapped): f(wrapped); return .Some(wrapped)
        case .None: return .None
        }
    }
    
    func onNone(f: Void -> Void) -> Optional {
        
        switch self {
        case .Some(let wrapped): return .Some(wrapped)
        case .None: f(); return .None
        }
    }
}
