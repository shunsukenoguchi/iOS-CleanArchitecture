import Foundation

/// API設定を管理する構造体
enum APIConfig {
    /// ベースURL
    static let baseURL = "https://pokeapi.co/api"
    
    /// デフォルトのAPIバージョン
    static let defaultAPIVersion = "v2"
    
    /// デフォルトのタイムアウト時間
    static let defaultTimeout: TimeInterval = 30.0
}

