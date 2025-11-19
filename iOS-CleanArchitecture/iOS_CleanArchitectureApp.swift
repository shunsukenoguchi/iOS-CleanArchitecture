//
//  iOS_CleanArchitectureApp.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import SwiftUI

@main
struct iOS_CleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .setupDependencies()
        }
    }
}

extension View {
    @MainActor
    func setupDependencies() -> some View {
        let apiClient = APIClient()
        let dataStore = FetchPokemonListDataStoreImpl(apiClient: apiClient)
        let pokemonRepository = PokemonRepositoryImpl(dataStore: dataStore)
        let fetchPokemonListUseCase = FetchPokemonList(pokemonRepository: pokemonRepository)
        let pokemonListViewModel = PokemonListViewModel(fetchPokemonListUseCase: fetchPokemonListUseCase)
        
        return self
            .environment(\.dataStore, dataStore)
            .environment(\.pokemonRepository, pokemonRepository)
            .environment(\.fetchPokemonListUseCase, fetchPokemonListUseCase)
            .environment(\.pokemonListViewModel, pokemonListViewModel)
    }
}
