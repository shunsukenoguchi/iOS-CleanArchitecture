//
//  FetchPokemonListRequest.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン一覧を取得するリクエスト
public struct FetchPokemonListRequest: APIRequest {
    public typealias ResponseType = Response
    
    public var apiVersion: String { APIConfig.defaultAPIVersion }

    public var baseURL: String { APIConfig.baseURL }
    
    public var path: String { "pokemon" }
    
    public var method: HTTPMethod { .get }
    
    public var headers: [String: String] { APIHeader.default }
    
    public var queryItems: [URLQueryItem]? { nil }
    
    public var body: Data? { nil }
    
    public var timeoutInterval: TimeInterval { APIConfig.defaultTimeout }
    
    public init() {}
    
    public struct Response: APIResponse {
        public var pokemonList: PokemonListEntity
        public var headers: Header?
        
        public init(pokemonList: PokemonListEntity, headers: Header? = nil) {
            self.pokemonList = pokemonList
            self.headers = headers
        }
    }
}

