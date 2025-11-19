import Foundation

protocol APIResponse: Decodable {
    var headers: Header? { get set }

    typealias Header = [String: String]
}