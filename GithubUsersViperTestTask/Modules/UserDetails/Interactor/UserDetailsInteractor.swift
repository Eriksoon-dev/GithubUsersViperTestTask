class UserDetailsInteractor: UserDetailsInteratorInput {
    private var apiService: GithubServiceProtocol!
    private var connectionService: ConnectionServiceProtocol!
    private var cacheService: LocalCacheService!
    weak var presenter: UserDetailsInteractorOutput!
    
    required init(apiService: GithubServiceProtocol, connectionService: ConnectionServiceProtocol, cacheService: LocalCacheService) {
        self.apiService = apiService
        self.connectionService = connectionService
        self.cacheService = cacheService
    }
    
    func getUserDetails(for identifier: String) {
        if self.connectionService.isinternetConnectionEnable {
            self.getUserDetailsFromInternet(identifier)
        } else {
            self.getUserDetailsFromCache(identifier)
        }
    }
    
    private func getUserDetailsFromInternet(_ identifier: String) {
        self.apiService.getUser(identifier) { [weak self] userDetails in
            let model = userDetails.convertToModel()
            self?.cacheService.saveUserDetailsToCache(model)
            // Output
            self?.presenter.didReceiveUserDetails(details: userDetails)
        }
    }
    
    private func getUserDetailsFromCache(_ identifier: String) {
        // get model from cache
        let model = self.cacheService.loadFromCache(key: identifier).first!
        
        // convert model to simple struct
        let userDetails = User(id: model.id, login: model.login, avatar: model.avatar, name: model.name, location: model.location, followers: model.followers.value, following: model.following.value)
        
        // Output
        self.presenter.didReceiveUserDetails(details: userDetails)
    }
    
    
}
