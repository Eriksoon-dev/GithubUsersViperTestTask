import UIKit

protocol UserListRouterInput: class {
    static func loadUserListModule() -> UIViewController
    
    var view: UserListViewController! { get set }
    
    func showUserDetails(user: UserViewModel)
}
