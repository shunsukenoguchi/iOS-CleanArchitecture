//
//  APIClient.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// PokeAPIと通信するための汎用的なHTTPクライアント
public final class APIClient {
    private let session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public convenience init() {
        self.init(session: .shared)
    }
    
    /// APIリクエストを実行する
    public func request<T: APIRequest>(_ request: T) async -> Result<T.ResponseType, APIError> {
        // URLの構築
        let urlString = "\(request.baseURL)/\(request.apiVersion)/\(request.path)"
        print("🌐 APIリクエスト: \(request.method.rawValue) \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("❌ 無効なURL: \(urlString)")
            return .failure(.invalidURL)
        }
        
        // URLRequestの構築
        var urlRequest = URLRequest(url: url, timeoutInterval: request.timeoutInterval)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        
        // ヘッダーの設定
        for (key, value) in request.headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        // クエリパラメータの設定
        if let queryItems = request.queryItems, !queryItems.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            if let urlWithQuery = components?.url {
                urlRequest.url = urlWithQuery
                print("🔗 クエリパラメータ付きURL: \(urlWithQuery)")
            }
        }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("❌ 無効なレスポンス")
                return .failure(.invalidResponse)
            }
            
            print("✅ HTTPステータスコード: \(httpResponse.statusCode)")
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("❌ HTTPエラー: \(httpResponse.statusCode)")
                return .failure(.httpError(statusCode: httpResponse.statusCode))
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodedResponse = try decoder.decode(T.ResponseType.self, from: data)
                print("✅ デコード成功")
                return .success(decodedResponse)
            } catch {
                print("❌ デコードエラー: \(error)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("📄 レスポンスデータ: \(jsonString.prefix(500))")
                }
                return .failure(.decodingError(error))
            }
        } catch {
            print("❌ ネットワークエラー: \(error)")
            return .failure(.networkError(error))
        }
    }
}

