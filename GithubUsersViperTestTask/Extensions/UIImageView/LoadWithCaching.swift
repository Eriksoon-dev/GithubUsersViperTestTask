import UIKit
import Alamofire

extension UIImageView {
    // load images with caching in URLSession
    func loadWithCaching(urlString: String, placeholderImageName: String? = nil ) {
        if let placeholder = placeholderImageName {
            self.image = UIImage(named: placeholder)
        } else {
            self.image = nil
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
            
        }.resume()
    }
}
