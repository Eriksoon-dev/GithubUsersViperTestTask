import UIKit

class UserDetailsRouter: UserDetailsRouterInput {
    var view: UserDetailsViewController!
    
    class func loadUserDetailsModule(with user: UserViewModel) -> UserDetailsViewController {
        let view = self.storyboard.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsViewController
        let presenter = UserDetailsPresenter(user: user)
        let interactor = UserDetailsInteractor(apiService: ApiService.shared, connectionService: NetworkService.shared, cacheService: LocalCacheService.shared)
        let router = UserDetailsRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "UserDetails", bundle: Bundle.main)
    }
    
}
