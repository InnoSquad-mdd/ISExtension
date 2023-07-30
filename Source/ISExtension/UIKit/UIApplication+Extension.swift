//
//  UIApplication+Extension.swift
//  ISExtension
//
//  Created by ethan parker on 2019/11/08.
//  Copyright © 2019 ethan parker. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UIApplication {
    public var applicationName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    
    public var versionString: String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        #if DEBUG
        return "\(version ?? "1.0.0") (\(build ?? "1")) Debug"
        #else
        return "\(version ?? "1.0.0") (\(build ?? "1"))"
        #endif
    }
    
    public var icon: UIImage? {
        if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return UIImage(named: lastIcon)
        }
        return nil
    }
}
#endif
