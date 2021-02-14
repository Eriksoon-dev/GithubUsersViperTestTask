import Foundation

typealias CompletionUsersHandler = (_ data: [User]) -> Void
typealias CompletionUserHandler = (_ data: User) -> Void

protocol GithubServiceProtocol {
    func getUsers(completion: @escaping CompletionUsersHandler)
    func getUser(_ identifier: String, completion: @escaping CompletionUserHandler)
}

// All static paths here
enum StaticPaths: String {
    case users = "/users"
}

class ApiService: GithubServiceProtocol {
    // Make it singleton
    static let shared = ApiService()
    
    private let baseUrl: String = "https://api.github.com"
    
    func getUsers(completion: @escaping CompletionUsersHandler) {
        // Create final path
        let finalPath = "\(self.baseUrl)\(StaticPaths.users.rawValue)"
        
        // take all users in closure
        self.get(path: finalPath) { (users: [User]) in
            completion(users)
        }
    }
    
    func getUser(_ identifier: String, completion: @escaping CompletionUserHandler) {
        // Create final path
        let finalPath = "\(self.baseUrl)\(StaticPaths.users.rawValue)/\(identifier)"
        
        // take user in closure
        self.get(path: finalPath) { (user: User) in
            completion(user)
        }
    }
    
    private func get<T: Decodable>(path: String, completion: @escaping (_ data: T) -> Void) {
        // Check if created path is a valid url
        guard let url = URL(string: path) else { return }
        
        // Let Network service make network call then take data and pass upwards
        NetworkService.shared.get(url: url) { (data: T) in
            completion(data)
        }
    }
}
