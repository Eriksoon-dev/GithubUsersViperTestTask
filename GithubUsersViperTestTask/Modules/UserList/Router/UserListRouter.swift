import Foundation
import UIKit

class UserListRouter {
    weak var view: UserListViewController!
}

extension UserListRouter: UserListRouterInput {
    class func loadUserListModule() -> UserListViewController {
        let view = self.storyboard.instantiateViewController(withIdentifier: "UserListVC") as! UserListViewController
        let presenter = UserListPresenter()
        let interactor = UserListInteractor(apiService: ApiService.shared)
        let router = UserListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "UserList", bundle: Bundle.main)
    }
    
    func showUserDetails(identifier: String) {
        let detailsVC = UserDetailsRouter.loadUserDetailsModule(with: identifier)
        self.view.present(detailsVC, animated: true, completion: nil)
    }
}
