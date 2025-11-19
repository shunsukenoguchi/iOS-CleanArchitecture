//
//  PokemonRepository.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン情報を取得するためのリポジトリプロトコル
protocol PokemonRepository {
    /// ポケモン一覧を取得する
    /// - Returns: ポケモン一覧エンティティ
    /// - Throws: APIError
    func fetchPokemonList() async throws -> PokemonList
}


final class PokemonRepositoryImpl: PokemonRepository {
    private let dataStore: FetchPokemonListDataStore
    
    init(dataStore: FetchPokemonListDataStore) {
        self.dataStore = dataStore
    }
    
    /// ポケモン一覧を取得する
    func fetchPokemonList() async throws -> PokemonList {
        let pokemonListEntity = try await dataStore.fetch()
        return PokemonListTranslater.translate(from: pokemonListEntity)
    }
}


