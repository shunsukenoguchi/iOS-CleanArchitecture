//
//  APIResponse.swift
//  iOS-CleanArchitecture
//
//  Created by 野口隼輔 on 2025/11/03.
//

import Foundation

public protocol APIResponse: Decodable {
    var headers: Header? { get set }

    typealias Header = [String: String]
}

