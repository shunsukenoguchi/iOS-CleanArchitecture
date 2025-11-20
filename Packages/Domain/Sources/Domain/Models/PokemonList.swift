//
//  PokemonList.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン一覧
public struct PokemonList {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [PokemonListItem]
    
    public init(count: Int, next: String?, previous: String?, results: [PokemonListItem]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

