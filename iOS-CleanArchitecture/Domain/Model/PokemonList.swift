//
//  PokemonList.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン一覧
struct PokemonList {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItem]
}

