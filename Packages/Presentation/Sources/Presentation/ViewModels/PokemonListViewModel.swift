//
//  PokemonListViewModel.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation
import Domain

/// ポケモン一覧画面のViewModel
@MainActor
@Observable
public final class PokemonListViewModel {
    // MARK: - Properties
    public private(set) var pokemons: [PokemonListItem] = []
    public private(set) var isLoading = false
    public private(set) var errorMessage: String?
    
    // MARK: - Dependencies
    private let fetchPokemonListUseCase: FetchPokemonList
    
    // MARK: - Initializer
    public init(fetchPokemonListUseCase: FetchPokemonList) {
        self.fetchPokemonListUseCase = fetchPokemonListUseCase
    }
    
    // MARK: - Public Methods
    
    /// ポケモン一覧を取得
    public func fetchPokemonList() async {
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

