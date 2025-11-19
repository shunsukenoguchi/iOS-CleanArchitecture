//
//  PokemonListItemTranslater.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// PokemonListEntity.PokemonListItemをPokemonListItemに変換するTranslater
struct PokemonListItemTranslater {
    /// EntityをDomainモデルに変換
    static func translate(from item: PokemonListItemEntity) -> PokemonListItem {
        return PokemonListItem(
            name: item.name,
            url: item.url
        )
    }
}

