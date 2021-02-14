class UserListPresenter: UserListPresenterInput {
    // Deny retain cycle
    weak var view: UserListPresenterOutput!
    var interactor: UserListInteractorInput!
    var router: UserListRouterInput!
    
    var userData = [UserViewModel]() {
        didSet {
            self.view.updateUsers(self.userData)
        }
    }
    
    func viewDidLoad() {
        self.view.setLoading(isLoading: true)
        self.interactor.getUsers()
    }
    
    func showUserDetails(user: UserViewModel) {
        self.router.showUserDetails(user: user)
    }
}

extension UserListPresenter: UserListInteractorOutput {
    func didReceiveUsers(_ users: [User]) {
        self.userData = users.map { UserViewModel(login: $0.login, avatar: $0.avatar) }
        self.view.setLoading(isLoading: false)
    }
}
