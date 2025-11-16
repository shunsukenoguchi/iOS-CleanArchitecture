struct FetchPokemonList {
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute() async throws -> PokemonList {
        let pokemonListEntity = try await pokemonRepository.fetchPokemonList()
        return PokemonListTranslater.translate(from: pokemonListEntity)
    }
}