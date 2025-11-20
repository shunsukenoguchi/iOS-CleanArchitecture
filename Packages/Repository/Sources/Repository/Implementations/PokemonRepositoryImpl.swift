//
//  PokemonRepositoryImpl.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation
import Domain
import Infra

public final class PokemonRepositoryImpl: PokemonRepository {
    private let dataStore: FetchPokemonListDataStore
    
    public init(dataStore: FetchPokemonListDataStore) {
        self.dataStore = dataStore
    }
    
    /// ポケモン一覧を取得する
    public func fetchPokemonList() async throws -> PokemonList {
        let pokemonListEntity = try await dataStore.fetch()
        return PokemonListTranslater.translate(from: pokemonListEntity)
    }
}

