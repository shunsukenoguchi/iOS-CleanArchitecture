import Foundation

/// APIリクエストのヘッダー
struct APIHeader {
    static let contentType = "Content-Type"
    
    static let applicationJSON = "application/json"
    
    /// デフォルトのヘッダー
    static var `default`: [String: String] {
        return [
            contentType: applicationJSON
        ]
    }
}
