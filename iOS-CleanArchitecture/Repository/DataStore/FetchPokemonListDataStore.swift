import Foundation

protocol FetchPokemonListDataStore {
    func fetch() async throws -> PokemonListEntity
}
