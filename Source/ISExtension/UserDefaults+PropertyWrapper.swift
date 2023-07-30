//
//  UserDefaults+Propertywrapper.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/08.
//  Copyright © 2019 ethan parker. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    let key: String
    let defaultValue: T

    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

@propertyWrapper
public struct UserDefaultCodable<T: Codable> {
    let key: String
    let defaultValue: T
    
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(T.self, forKey: key) ?? defaultValue
        }
        set {
            UserDefaults.standard.setObject(newValue, forKey: key)
        }
    }
}
