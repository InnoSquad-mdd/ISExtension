//
//  UIViewController+Extension.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/08.
//  Copyright © 2019 ethan parker. All rights reserved.
//

import UIKit

public protocol StoryboardName {
    var name: String { get }
}

public extension UIViewController {
    class func instance<T>(storyboardName: StoryboardName, identifier: String? = nil) -> T where T: UIViewController {
        var identifier = identifier
        let storyboard = UIStoryboard(name: storyboardName.name, bundle: nil)
        
        if identifier == nil {
            identifier = String(describing: T.self)
        }
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier ?? "") as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(String(describing: identifier))")
        }
        return viewController
    }
    
    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
