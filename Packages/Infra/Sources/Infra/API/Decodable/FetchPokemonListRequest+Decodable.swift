//
//  FetchPokemonListRequest+Decodable.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

extension FetchPokemonListRequest.Response: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // APIのJSONから各フィールドをデコード
        let count = try container.decode(Int.self, forKey: .count)
        let next = try container.decodeIfPresent(String.self, forKey: .next)
        let previous = try container.decodeIfPresent(String.self, forKey: .previous)
        let results = try container.decode([ResultItem].self, forKey: .results)
        
        // PokemonListEntityに変換
        let pokemonList = PokemonListEntity(
            count: count,
            next: next,
            previous: previous,
            results: results.map { item in
                PokemonListItemEntity(
                    name: item.name,
                    url: item.url
                )
            }
        )
        
        self.pokemonList = pokemonList
        self.headers = nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    // APIのJSONアイテム構造
    private struct ResultItem: Decodable {
        let name: String
        let url: String
    }
}

