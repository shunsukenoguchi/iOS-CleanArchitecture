//
//  FetchPokemonListDataStoreImpl.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン一覧を取得するDataStore
public final class FetchPokemonListDataStoreImpl: FetchPokemonListDataStore {
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    /// ポケモン一覧を取得する
    /// - Returns: ポケモン一覧エンティティ
    /// - Throws: APIError
    public func fetch() async throws -> PokemonListEntity {        
        let result = await apiClient.request(FetchPokemonListRequest())
        
        switch result {
        case .success(let response):
            return response.pokemonList
        case .failure(let error):
            throw error
        }
    }
}

