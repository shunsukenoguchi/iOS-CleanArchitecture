/// PokeAPIのポケモン一覧レスポンス
struct PokemonListEntity {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItemEntity]
}

/// ポケモン一覧の各アイテム
struct PokemonListItemEntity {
    let name: String
    let url: String
}

