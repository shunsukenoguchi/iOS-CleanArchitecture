//
//  PokemonListItemTranslater.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation
import Domain
import Infra

/// PokemonListEntity.PokemonListItemをPokemonListItemに変換するTranslater
public struct PokemonListItemTranslater {
    /// EntityをDomainモデルに変換
    public static func translate(from item: PokemonListItemEntity) -> PokemonListItem {
        return PokemonListItem(
            name: item.name,
            url: item.url
        )
    }
}

