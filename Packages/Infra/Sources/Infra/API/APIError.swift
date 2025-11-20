//
//  APIError.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// APIクライアントのエラー型
public enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(Error)
}

// MARK: - LocalizedError
extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "無効なURLです"
        case .networkError(let error):
            return "ネットワークエラー: \(error.localizedDescription)"
        case .invalidResponse:
            return "無効なレスポンスです"
        case .httpError(let statusCode):
            return "HTTPエラー (ステータスコード: \(statusCode))"
        case .decodingError(let error):
            return "データの解析に失敗しました: \(error.localizedDescription)"
        }
    }
}

