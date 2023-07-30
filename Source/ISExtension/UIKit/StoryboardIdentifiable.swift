//
//  StoryboardIdentifiable.swift
//  
//
//  Created by ethan parker on 2021/10/05.
//

import UIKit
import SwiftUI

public protocol StoryboardIdentifiable: AnyObject {
    static var identifier: String { get }
}

public extension StoryboardIdentifiable where Self: UIViewController {
    static func instance<T>() -> T where T: UIViewController {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(String(describing: identifier))")
        }
        return viewController
    }
}
