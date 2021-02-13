import Foundation
import Alamofire

class NetworkService {
    // Make it singleton
    static let shared = NetworkService()
    
    // Make it generic to reuse
    func get<T: Decodable>(url: URL, completion: @escaping (_ data: T) -> Void) {
        AF.request(url)
          .validate()
          .responseDecodable(of: T.self) { response in
                guard let users = response.value else { return }
                completion(users)
            }
    }
}
