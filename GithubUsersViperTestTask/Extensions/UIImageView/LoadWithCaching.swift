import UIKit
import Alamofire

extension UIImageView {
    // load images with caching in URLSession
    func loadWithCaching(urlString: String, placeholderImageName: String? = nil ) {
        // make downloading images out of main thread
        DispatchQueue.global().async {
            // update ui in main thread
            DispatchQueue.main.async {
                if let placeholder = placeholderImageName {
                    self.image = UIImage(named: placeholder)
                } else {
                    self.image = nil
                }
            }
            
            guard let url = URL(string: urlString) else { return }
            
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
            
            URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
                guard let data = data, let image = UIImage(data: data) else { return }
                // update ui in main thread
                DispatchQueue.main.async {
                    self?.image = image
                }
                
            }.resume()
        }
        
    }
}
