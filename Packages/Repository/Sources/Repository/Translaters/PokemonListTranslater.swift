//
//  PokemonListTranslater.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation
import Domain
import Infra

/// PokemonListEntityをPokemonListに変換するTranslater
public struct PokemonListTranslater {
    /// EntityをDomainモデルに変換
    public static func translate(from entity: PokemonListEntity) -> PokemonList {
        return PokemonList(
            count: entity.count,
            next: entity.next,
            previous: entity.previous,
            results: entity.results.map { PokemonListItemTranslater.translate(from: $0) }
        )
    }
}

