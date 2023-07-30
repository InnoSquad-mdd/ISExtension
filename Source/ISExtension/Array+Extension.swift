//
//  Array+Extension.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/08.
//  Copyright © 2019 ethan parker. All rights reserved.
//

import Foundation

extension Array {
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
