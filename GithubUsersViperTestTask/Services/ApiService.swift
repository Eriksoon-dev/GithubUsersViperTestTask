import Foundation

typealias CompletionHandler = (_ data: [User]) -> Void
typealias CompletionUserDetailHandler = (_ data: UserDetail) -> Void

protocol GithubServiceProtocol {
    func getUsers(completion: @escaping CompletionHandler)
    func getUser(_ identifier: String, completion: @escaping CompletionUserDetailHandler)
}

// All static paths here
enum StaticPaths: String {
    case users = "/users"
}

class ApiService: GithubServiceProtocol {
    // Make it singleton
    static let shared = ApiService()
    
    private let baseUrl: String = "https://api.github.com"
    
    func getUsers(completion: @escaping CompletionHandler) {
        
        // Create final path
        let finalUrlString = "\(self.baseUrl)\(StaticPaths.users.rawValue)"
        
        // Check if created path is a valid url
        guard let url = URL(string: finalUrlString) else { return }
        
        // Make a request to valid url in Network service
        NetworkService.shared.get(url: url) { (data: [User]) in
            completion(data)
        }
    }
    
    func getUser(_ identifier: String, completion: @escaping CompletionUserDetailHandler) {
        
        // Create final path
        let finalUrlString = "\(self.baseUrl)\(StaticPaths.users.rawValue)/\(identifier)"
        
        // Check if created path is a valid url
        guard let url = URL(string: finalUrlString) else { return }
        
        NetworkService.shared.get(url: url) { (data: UserDetail) in
            completion(data)
        }
    }
}
