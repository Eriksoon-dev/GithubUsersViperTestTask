import UIKit

class UserDetailsRouter: UserDetailsRouterInput {
    var view: UserDetailsViewController!
    
    class func loadUserDetailsModule(with identifier: String) -> UserDetailsViewController {
        let view = self.storyboard.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsViewController
        let presenter = UserDetailsPresenter(identifier: identifier)
        let interactor = UserDetailsInteractor(apiService: ApiService.shared)
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
