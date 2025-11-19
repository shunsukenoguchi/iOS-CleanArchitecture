struct FetchPokemonList {
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute() async throws -> PokemonList {
        return try await pokemonRepository.fetchPokemonList()
    }
}