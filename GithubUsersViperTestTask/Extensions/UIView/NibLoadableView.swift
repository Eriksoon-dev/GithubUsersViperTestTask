import UIKit

extension UIView {
    // Simple mechanism to take nibName to instanciate nib afterwards
    static var nibName: String {
        return String(describing: self)
    }
}
