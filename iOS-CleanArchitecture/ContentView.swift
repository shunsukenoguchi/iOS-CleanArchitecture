//
//  ContentView.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import SwiftUI
import Presentation
import Domain
import Infra
import Repository

struct ContentView: View {
    @State private var viewModel: PokemonListViewModel
    
    init() {
        let apiClient = APIClient()
        let dataStore = FetchPokemonListDataStoreImpl(apiClient: apiClient)
        let pokemonRepository = PokemonRepositoryImpl(dataStore: dataStore)
        let fetchPokemonListUseCase = FetchPokemonList(pokemonRepository: pokemonRepository)
        let pokemonListViewModel = PokemonListViewModel(fetchPokemonListUseCase: fetchPokemonListUseCase)
        
        self._viewModel = State(initialValue: pokemonListViewModel)
    }
    
    var body: some View {
        VStack {
            PokemonListView(viewModel: viewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
