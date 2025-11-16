import Foundation

protocol FetchPokemonListDataStore {
    func fetch() async throws -> PokemonListEntity
}

/// ポケモン一覧を取得するDataStore
final class FetchPokemonListDataStoreImpl: FetchPokemonListDataStore {
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }
    
    /// ポケモン一覧を取得する
    /// - Returns: ポケモン一覧エンティティ
    /// - Throws: APIError
    func fetch() async throws -> PokemonListEntity {        
        let result = await apiClient.request(FetchPokemonListRequest())
        
        switch result {
        case .success(let response):
            return response.pokemonList
        case .failure(let error):
            throw error
        }
    }
}
