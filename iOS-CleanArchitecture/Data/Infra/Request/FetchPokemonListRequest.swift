import Foundation

/// ポケモン一覧を取得するリクエスト
struct FetchPokemonListRequest: APIRequest {
    typealias ResponseType = Response
    
    var apiVersion: String { APIConfig.defaultAPIVersion }

    var baseURL: String { APIConfig.baseURL }
    
    var path: String { "pokemon" }
    
    var method: HTTPMethod { .get }
    
    var headers: [String: String] { APIHeader.default }
    
    var queryItems: [URLQueryItem]? { nil }
    
    var body: Data? { nil }
    
    var timeoutInterval: TimeInterval { APIConfig.defaultTimeout }
    
    init() {}
    
    struct Response: APIResponse {
        var pokemonList: PokemonListEntity
        var headers: Header?
    }
}