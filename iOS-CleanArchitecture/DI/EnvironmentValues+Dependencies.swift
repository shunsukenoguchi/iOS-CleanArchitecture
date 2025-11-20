//
//  EnvironmentValues+Dependencies.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/19.
//

import SwiftUI
import Foundation
import Domain
import Infra
import Repository
import Presentation

extension EnvironmentValues {
    /// FetchPokemonListDataStore への環境アクセス
    var dataStore: FetchPokemonListDataStore {
        get { self[FetchPokemonListDataStoreKey.self] }
        set { self[FetchPokemonListDataStoreKey.self] = newValue }
    }
    
    /// PokemonRepository への環境アクセス
    var pokemonRepository: PokemonRepository {
        get { self[PokemonRepositoryKey.self] }
        set { self[PokemonRepositoryKey.self] = newValue }
    }
    
    /// FetchPokemonList UseCase への環境アクセス
    var fetchPokemonListUseCase: FetchPokemonList {
        get { self[FetchPokemonListUseCaseKey.self] }
        set { self[FetchPokemonListUseCaseKey.self] = newValue }
    }
    
    /// PokemonListViewModel への環境アクセス
    public var pokemonListViewModel: PokemonListViewModel {
        get { self[PokemonListViewModelKey.self] }
        set { self[PokemonListViewModelKey.self] = newValue }
    }
}

