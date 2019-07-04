//
//  Extensions.swift
//  Yep
//
//  Created by Octree on 2019/7/4.
//  Copyright © 2019 Octree. All rights reserved.
//

import Foundation

extension String {
    
    var lastPathComponent: String {
        return (self as NSString).lastPathComponent
    }
    var pathExtension: String {
        return (self as NSString).pathExtension
    }
    var deletingLastPathComponent: String {
        return (self as NSString).deletingLastPathComponent
    }
    var deletingPathExtension: String {
        return (self as NSString).deletingPathExtension
    }
    var pathComponents: [String] {
        return (self as NSString).pathComponents
    }
    func appendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
    func appendingPathExtension(ext: String) -> String? {
        let nsSt = self as NSString
        return nsSt.appendingPathExtension(ext)
    }
    
    func capitalizingFirstLetter() -> String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }
    
    func lowercaseFirstLetter() -> String {
        let first = String(prefix(1)).lowercased()
        let other = String(dropFirst())
        return first + other
    }
}

extension URL {
    var isDirectory: Bool {
        return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
    var subDirectories: [URL] {
        guard isDirectory else { return [] }
        return (try? FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]).filter{ $0.isDirectory }) ?? []
    }
}

extension String {
    var absolutePath: String {
        let pwd = FileManager.default.currentDirectoryPath
        if hasPrefix("/") {
            return self
        } else {
            return URL(string: self, relativeTo: URL(fileURLWithPath: pwd))!.path
        }
    }
}
