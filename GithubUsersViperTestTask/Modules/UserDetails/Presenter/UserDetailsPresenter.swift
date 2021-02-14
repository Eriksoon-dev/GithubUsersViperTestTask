class UserDetailsPresenter: UserDetailsPresenterInput {
    weak var view: UserDetailsPresenterOutput!
    var interactor: UserDetailsInteratorInput!
    var router: UserDetailsRouterInput!
    
    private var userIdentifier: String!
    
    required init(identifier: String) {
        self.userIdentifier = identifier
    }
    
    func viewDidLoad() {
        self.interactor.getUserDetails(for: self.userIdentifier)
    }
}

extension UserDetailsPresenter: UserDetailsInteractorOutput {
    func didReceiveUserDetails(details: User) {
        self.view.updateUserDetails(details: details)
    }
}
