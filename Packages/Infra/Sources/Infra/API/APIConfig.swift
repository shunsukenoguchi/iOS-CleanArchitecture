//
//  APIConfig.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// API設定を管理する構造体
public enum APIConfig {
    /// ベースURL
    public static let baseURL = "https://pokeapi.co/api"
    
    /// デフォルトのAPIバージョン
    public static let defaultAPIVersion = "v2"
    
    /// デフォルトのタイムアウト時間
    public static let defaultTimeout: TimeInterval = 30.0
}

