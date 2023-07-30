//
//  Optional+Extension.swift
//  
//
//  Created by Chang Woo Son on 2022/01/01.
//

import Foundation

public extension Optional {
    /// Returns a Boolean value indicating whether value is `nil`
    ///
    ///     var a: Int? = nil
    ///     print(a.isNil)
    ///     // Prints "true"
    ///     a = 1
    ///     print(a.isNil)
    ///     // Prints "false"
    var isNil: Bool {
        return self == nil
    }
    
    /// Returns a Boolean value indicating whether value is not `nil`
    ///
    ///     var a: Int? = nil
    ///     print(a.isNotNil)
    ///     // Prints "false"
    ///     a = 1
    ///     print(a.isNotNil)
    ///     // Prints "true"
    var isNotNil: Bool {
        return self != nil
    }
    
    /// value가 `nil` 인 경우, default value를 반환, `nil`이 아닌 경우, Wrapped 반환
    ///
    ///     var a: Int? = nil
    ///     print(a.ifNil(then: 0))
    ///     // Prints "0"
    ///     a = 1
    ///     print(a.ifNil(then: 0))
    ///     // Prints "1"
    func ifNil(then defaultValue: Wrapped) -> Wrapped {
        if case let .some(value) = self {
            return value
        }
        return defaultValue
    }
}

public extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
