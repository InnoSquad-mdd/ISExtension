//
//  String+Extension.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/08.
//  Copyright © 2019 ethan parker. All rights reserved.
//

import Foundation


public extension String {
    static let empty = ""
    
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedFormat(_ arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
    
    /// Bool을 의미하는 문자열을 Bool 타입으로 변경하여 반환
    ///
    ///     Y, YES, 1, TRUE -> true로 반환
    ///     N, NO, 0, FALSE -> false로 반환
    ///     기타 문자열 -> nil 반환
    var asBool: Bool? {
        switch self.uppercased() {
        case "Y", "YES", "1", "TRUE": return true
        case "N", "NO", "0", "FALSE": return false
        default: return nil
        }
    }
    
    /// Returns a new string made by removing from both ends of the String
    ///
    ///     let str = "  String  "
    ///     print(str.trim)
    ///     // Prints "String"
    var trim: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// 문자열 맨 앞에 Whitespace 있는 경우 제거 후 반환
    ///
    ///     let str = "  String  "
    ///     print(str.trimLeading)
    ///     // Prints "String  "
    var trimLeading: String {
        return self.replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
    }
    
    /// 모든 Whitespace를 제거
    var removedAllWhitespace: String {
        self.replacingOccurrences(of: "^\\s+|\\s+|\\s+$", with: "", options: .regularExpression)
    }
    
    /// `,` 추가한 문자열 반환 ex)100,000
    ///
    ///     let plus = "100000"
    ///     print(plus.addComma)
    ///     // Prints "100,000"
    ///
    ///     let minus = "-100000"
    ///     print(minus.addComma)
    ///     // Prints "-100,000"
    ///
    ///     let str1 = "ABC"
    ///     print(str1.addComma)
    ///     // Prints "0"
    ///
    ///     let str2 = ""
    ///     print(str2.addComma)
    ///     // Prints ""
    var addComma: String {
        if self.isEmpty {
            return ""
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if self.contains("-") {
            let integerValue = Int64(self)
            guard let result = numberFormatter.string(from: NSNumber(value: integerValue ?? 0)) else { return "0" }
            return result
        } else {
            let integerValue = UInt64(self)
            guard let result = numberFormatter.string(from: NSNumber(value: integerValue ?? 0)) else { return "0" }
            return result
        }
    }
    
    /// 빈 문자열인 경우, 지정한 문자열을 반환
    ///
    /// - Parameter defaultString: 빈 문자열일 때, 반환할 문자열
    /// - Returns: 빈 문자열인 경우, 지정한 문자열을 반환
    func ifEmpty(then defaultString: String) -> String {
        isEmpty ? defaultString : self
    }
    
    /**
     문자열을 Int 타입의 값으로 반환함. 문자열이 숫자가 아니면 0을 반환함.
     ```
     print("100".intValue)  // Print 100
     print("-100".intValue) // Print -100
     ```
     */
    var intValue: Int {
        guard let _intValue = Int(self) else {
            return 0
        }
        return _intValue
    }
    
    var yyyyMMddToDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.date(from: self)
    }
}
