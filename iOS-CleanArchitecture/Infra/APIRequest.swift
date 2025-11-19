import Foundation

protocol APIRequest {
    associatedtype ResponseType: APIResponse

    var apiVersion: String { get }
    var path: String { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
    var timeoutInterval: TimeInterval { get }
}