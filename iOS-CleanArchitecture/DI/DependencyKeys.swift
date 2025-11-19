//
//  DependencyKeys.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/19.
//

import SwiftUI
import Foundation

// MARK: - FetchPokemonListDataStore Key

/// FetchPokemonListDataStore の Environment Key
struct FetchPokemonListDataStoreKey: EnvironmentKey {
    static let defaultValue: FetchPokemonListDataStore = FetchPokemonListDataStoreImpl(
        apiClient: APIClient()
    )
}

// MARK: - PokemonRepository Key

/// PokemonRepository の Environment Key
struct PokemonRepositoryKey: EnvironmentKey {
    static let defaultValue: PokemonRepository = PokemonRepositoryImpl(
        dataStore: FetchPokemonListDataStoreKey.defaultValue
    )
}

// MARK: - FetchPokemonList UseCase Key

/// FetchPokemonList UseCase の Environment Key
struct FetchPokemonListUseCaseKey: EnvironmentKey {
    static let defaultValue: FetchPokemonList = FetchPokemonList(
        pokemonRepository: PokemonRepositoryKey.defaultValue
    )
}

// MARK: - PokemonListViewModel Key

/// PokemonListViewModel の Environment Key
@MainActor
struct PokemonListViewModelKey: EnvironmentKey {
    static let defaultValue: PokemonListViewModel = PokemonListViewModel(
        fetchPokemonListUseCase: FetchPokemonListUseCaseKey.defaultValue
    )
}

