class UserDetailsInteractor: UserDetailsInteratorInput {
    private var apiService: GithubServiceProtocol!
    weak var presenter: UserDetailsInteractorOutput!
    
    required init(apiService: GithubServiceProtocol) {
        self.apiService = apiService
    }
    
    func getUserDetails(for identifier: String) {
        self.apiService.getUser(identifier) { [weak self] details in
            self?.presenter.didReceiveUserDetails(details: details)
        }
    }
    
    
}
