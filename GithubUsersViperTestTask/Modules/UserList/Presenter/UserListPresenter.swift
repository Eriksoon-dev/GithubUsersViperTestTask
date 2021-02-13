class UserListPresenter: UserListPresenterInput {
    // Deny retain cycle
    weak var view: UserListPresenterOutput!
    var interactor: UserListInteractorInput!
    var router: UserListRouterInput!
    
    func viewDidLoad() {
        self.view.setLoading(isLoading: true)
        self.interactor.getUsers()
    }
}

extension UserListPresenter: UserListInteractorOutput {
    func didReceiveUsers(_ users: [User]) {
        self.view.setLoading(isLoading: false)
        self.view.updateUsers(users)
    }
}
