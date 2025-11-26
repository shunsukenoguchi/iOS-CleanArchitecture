//
//  PokemonListView.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import SwiftUI
import Domain

/// ポケモン一覧画面
public struct PokemonListView: View {
    @State private var viewModel: PokemonListViewModel
    
    public init(viewModel: PokemonListViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            Group {
                switch viewModel.uiState {
                    case .loading:
                        ProgressView("読み込み中...")
                    case .error(let errorMessage):
                        VStack(spacing: 16) {
                            Text("エラー")
                                .font(.headline)
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                    case .success:
                        List(viewModel.pokemons, id: \.name) { pokemon in
                            PokemonListItemView(pokemon: pokemon)
                        }
                        .listStyle(.plain)
                    default:
                        EmptyView()
                    
                }
            }
            .navigationTitle("ポケモン一覧")
            .task {
                await viewModel.fetchPokemonList()
            }
        }
    }
}

/// ポケモン一覧の各セル
struct PokemonListItemView: View {
    let pokemon: PokemonListItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(pokemon.name.capitalized)
                .font(.headline)
            Text(pokemon.url)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Preview
#Preview {
    // Preview用のモックViewModelを作成
    let mockRepository = MockPokemonRepository()
    let mockUseCase = FetchPokemonList(pokemonRepository: mockRepository)
    let mockViewModel = PokemonListViewModel(fetchPokemonListUseCase: mockUseCase)
    
    return PokemonListView(viewModel: mockViewModel)
}

// MARK: - Mock for Preview
private struct MockPokemonRepository: PokemonRepository {
    func fetchPokemonList() async throws -> PokemonList {
        return PokemonList(
            count: 3,
            next: nil,
            previous: nil,
            results: [
                PokemonListItem(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
                PokemonListItem(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
                PokemonListItem(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/")
            ]
        )
    }
}

