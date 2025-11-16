//
//  PokemonListViewModel.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン一覧画面のViewModel
@MainActor
@Observable
final class PokemonListViewModel {
    // MARK: - Properties
    private(set) var pokemons: [PokemonListItem] = []
    private(set) var isLoading = false
    private(set) var errorMessage: String?
    
    // MARK: - Dependencies
    private let fetchPokemonListUseCase: FetchPokemonList
    
    // MARK: - Initializer
    init(fetchPokemonListUseCase: FetchPokemonList? = nil) {
        self.fetchPokemonListUseCase = fetchPokemonListUseCase ?? FetchPokemonList(
            pokemonRepository: PokemonRepositoryImpl()
        )
    }
    
    // MARK: - Public Methods
    
    /// ポケモン一覧を取得
    func fetchPokemonList() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let pokemonList = try await fetchPokemonListUseCase.execute()
            pokemons = pokemonList.results
        } catch {
            errorMessage = "ポケモン一覧の取得に失敗しました: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

