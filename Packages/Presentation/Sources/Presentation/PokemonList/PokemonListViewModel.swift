import Foundation
import Domain

@MainActor
@Observable
public final class PokemonListViewModel {   
    public private(set) var uiState: PokemonListUIState = .loading
    public private(set) var pokemons: [PokemonListItem] = []
    
    private let fetchPokemonListUseCase: FetchPokemonList
    
    public init(fetchPokemonListUseCase: FetchPokemonList) {
        self.fetchPokemonListUseCase = fetchPokemonListUseCase
    }
    
    public func fetchPokemonList() async {
        uiState = .loading
        
        do {
            let pokemonList = try await fetchPokemonListUseCase.execute()
            pokemons = pokemonList.results
            uiState = .success
        } catch {
            uiState = .error("ポケモン一覧の取得に失敗しました: \(error.localizedDescription)")
        }
    }
}

public enum PokemonListUIState {
    case loading
    case error(String)
    case success
}
