//
//  Int+Extension.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/08.
//  Copyright © 2019 ethan parker. All rights reserved.
//

import Foundation

public extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self)) ?? ""
    }
    
    var ordinal: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(value: self))
    }
    
    /// 0인 경우 true, 0이 아니면 false
    ///
    ///     print(-1.isZero, 0.isZero, 1.isZero)
    ///     // Prints "false, true, false"
    var isZero: Bool {
        return self == 0
    }
    /// 0이 아닌 경우 true, 0인 경우 false
    ///
    ///     print(-1.isNotZero, 0.isNotZero, 1.isNotZero)
    ///     // Prints "true, false, true"
    var isNotZero: Bool {
        return !isZero
    }
    
    /// 1인 경우 true, 1이 아니면 false
    ///
    ///     print(-1.isOne, 0.isOne, 1.isOne)
    ///     // Prints "false, false, true"
    var isOne: Bool {
        return self == 1
    }
    
    /// 0보다 큰 경우 true, 1보다 작은 경우 false
    ///
    ///     print(-1.isPositive, 0.isPositive, 1.isPositive)
    ///     // Prints "false, false, true"
    var isPositive: Bool {
        return self > 0
    }
    
    /// 0보다 작은 경우 true, -1보다 큰 경우 false
    ///
    ///     print(-1.isNegative, 0.isNegative, 1.isNegative)
    ///     // Prints "true, false, false"
    var isNegative: Bool {
        return self < 0
    }
    
    var decimal: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
