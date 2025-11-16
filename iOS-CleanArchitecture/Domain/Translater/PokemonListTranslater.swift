//
//  PokemonListTranslater.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// PokemonListEntityをPokemonListに変換するTranslater
struct PokemonListTranslater {
    /// EntityをDomainモデルに変換
    static func translate(from entity: PokemonListEntity) -> PokemonList {
        return PokemonList(
            count: entity.count,
            next: entity.next,
            previous: entity.previous,
            results: entity.results.map { PokemonListItemTranslater.translate(from: $0) }
        )
    }
}

