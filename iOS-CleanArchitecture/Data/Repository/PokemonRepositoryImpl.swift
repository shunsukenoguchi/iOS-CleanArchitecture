//
//  PokemonRepositoryImpl.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// PokemonRepositoryの実装
final class PokemonRepositoryImpl: PokemonRepository {
    private let dataStore: FetchPokemonListDataStore
    
    init(dataStore: FetchPokemonListDataStore = FetchPokemonListDataStoreImpl()) {
        self.dataStore = dataStore
    }
    
    /// ポケモン一覧を取得する
    func fetchPokemonList() async throws -> PokemonListEntity {
        return try await dataStore.fetch()
    }
}

