import Foundation
import UIKit

class UserListRouter {
    weak var view: UserListViewController!
}

extension UserListRouter: UserListRouterInput {
    class func loadUserListModule() -> UIViewController {
        let view = self.storyboard.instantiateViewController(withIdentifier: "UserListVC") as! UserListViewController
        let navigationController = UINavigationController(rootViewController: view)
        let presenter = UserListPresenter()
        let interactor = UserListInteractor(apiService: ApiService.shared, connectionService: NetworkService.shared, cacheService: LocalCacheService.shared)
        let router = UserListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        view.navigationItem.title = "Github users"
        
        return navigationController
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "UserList", bundle: Bundle.main)
    }
    
    func showUserDetails(user: UserViewModel) {
        let detailsVC = UserDetailsRouter.loadUserDetailsModule(with: user)
        detailsVC.navigationItem.title = user.login
        self.view.navigationController!.pushViewController(detailsVC, animated: true)
    }
}
