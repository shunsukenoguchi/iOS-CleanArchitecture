//
//  PokemonRepository.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

/// ポケモン情報を取得するためのリポジトリプロトコル
public protocol PokemonRepository {
    /// ポケモン一覧を取得する
    /// - Returns: ポケモン一覧エンティティ
    /// - Throws: APIError
    func fetchPokemonList() async throws -> PokemonList
}

