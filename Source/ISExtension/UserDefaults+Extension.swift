//
//  UserDefaults+Extension.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/13.
//  Copyright © 2019 ethan parker. All rights reserved.
//

import Foundation

extension UserDefaults {
    public func setObject<T: Encodable>(_ value: T, forKey key: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: key)
    }
    
    public func object<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = data(forKey: key) {
            return try? JSONDecoder().decode(type, from: data)
        }
        return nil
    }
}
