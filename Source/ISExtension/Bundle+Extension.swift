//
//  Bundle+Extension.swift
//  
//
//  Created by ethan parker on 2021/10/16.
//

import Foundation


extension Bundle {
    public var appVersion: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    public func currentAppStoreVersion(handler: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let info = self.infoDictionary,
                let identifier = info["CFBundleIdentifier"] as? String,
                let url = URL(string: "https://itunes.apple.com/lookup?bundleId=\(identifier)") else {
                    handler(.failure(URLError(.badURL)))
                    return
            }
            do {
                let data = try Data(contentsOf: url)
                guard let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else {
                    return
                }
                guard let result = (json["results"] as? [Any])?.first as? [String: Any], let version = result["version"] as? String else {
                    return
                }
                handler(.success(version))
            } catch let error {
                handler(.failure(error))
            }
        }
    }
}
