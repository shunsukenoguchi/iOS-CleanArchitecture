//
//  PokemonListView.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import SwiftUI

/// ポケモン一覧画面
struct PokemonListView: View {
    @Environment(\.fetchPokemonListUseCase) private var useCase
    @State private var viewModel: PokemonListViewModel?
    
    var body: some View {
        NavigationView {
            Group {
                if let viewModel = viewModel {
                    if viewModel.isLoading {
                        ProgressView("読み込み中...")
                    } else if let errorMessage = viewModel.errorMessage {
                        VStack(spacing: 16) {
                            Text("エラー")
                                .font(.headline)
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                            Button("再試行") {
                                Task {
                                    await viewModel.fetchPokemonList()
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                        .padding()
                    } else {
                        List(viewModel.pokemons, id: \.name) { pokemon in
                            PokemonListItemView(pokemon: pokemon)
                        }
                        .listStyle(.plain)
                    }
                } else {
                    ProgressView("初期化中...")
                }
            }
            .navigationTitle("ポケモン一覧")
            .onAppear {
                if viewModel == nil {
                    viewModel = PokemonListViewModel(fetchPokemonListUseCase: useCase)
                }
            }
            .task {
                if let viewModel = viewModel {
                    await viewModel.fetchPokemonList()
                }
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
    PokemonListView()
}

