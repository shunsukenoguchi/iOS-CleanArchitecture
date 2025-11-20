//
//  PokemonListEntity.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// PokeAPIのポケモン一覧レスポンス
public struct PokemonListEntity {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [PokemonListItemEntity]
    
    public init(count: Int, next: String?, previous: String?, results: [PokemonListItemEntity]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

/// ポケモン一覧の各アイテム
public struct PokemonListItemEntity {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

