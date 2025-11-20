//
//  APIHeader.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// APIリクエストのヘッダー
public struct APIHeader {
    public static let contentType = "Content-Type"
    
    public static let applicationJSON = "application/json"
    
    /// デフォルトのヘッダー
    public static var `default`: [String: String] {
        return [
            contentType: applicationJSON
        ]
    }
}

