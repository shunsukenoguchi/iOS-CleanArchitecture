//
//  FetchPokemonList.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

public struct FetchPokemonList {
    private let pokemonRepository: PokemonRepository
    
    public init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    public func execute() async throws -> PokemonList {
        return try await pokemonRepository.fetchPokemonList()
    }
}

