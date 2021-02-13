// Business logic goes here
class UserListInteractor: UserListInteractorInput {
    private var apiService: GithubServiceProtocol!
    weak var presenter: UserListInteractorOutput!
    
    required init(apiService: GithubServiceProtocol) {
        // For soliD
        self.apiService = apiService
    }
    
    // Input
    func getUsers() {
        self.apiService.getUsers { [weak self] users in
            // Output
            self?.presenter.didReceiveUsers(users)
        }
    }
}
