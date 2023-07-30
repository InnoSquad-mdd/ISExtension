//
//  Collection+Extension.swift
//  
//
//  Created by Chang Woo Son on 2022/01/01.
//

import Foundation


public extension Collection {
    /**
     Collection이 비어있지 않은지 나타내는 Boolean 값 반환

     ```
     let arr1 = [1,2,3,4]
     let arr2 = []
     print(arr1.isNotEmpty)
     // Prints "true"
     print(arr2.isNotEmpty)
     // Prints "false"
     ```
     */
    var isNotEmpty: Bool {
        return !isEmpty
    }
}
