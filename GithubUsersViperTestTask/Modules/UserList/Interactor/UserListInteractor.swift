// Business logic goes here
class UserListInteractor: UserListInteractorInput {
    private var apiService: GithubServiceProtocol!
    private var connectionService: ConnectionServiceProtocol!
    private var cacheService: LocalCacheService!
    weak var presenter: UserListInteractorOutput!
    
    required init(apiService: GithubServiceProtocol, connectionService: ConnectionServiceProtocol, cacheService: LocalCacheService) {
        // For soliD
        self.apiService = apiService
        self.connectionService = connectionService
        self.cacheService = cacheService
    }
    
    // Input
    func getUsers() {
        if self.connectionService.isinternetConnectionEnable {
            self.getUsersFromInternet()
        } else {
            self.getUsersFromCache()
        }
    }
    
    private func getUsersFromInternet() {
        self.apiService.getUsers { [weak self] users in
            let models = users.map { $0.convertToModel() }
            self?.cacheService.saveUsersToCache(models)
            // Output
            self?.presenter.didReceiveUsers(users)
        }
    }
    
    private func getUsersFromCache() {
        // get all user models from cache
        let userModels = self.cacheService.loadFromCache()
        
        // convert models to simple structs
        let users = userModels.map { model in
            return User(id: model.id, login: model.login, avatar: model.avatar, name: model.name, location: model.location, followers: model.followers.value, following: model.following.value)
        }.sorted(by: { $0.id < $1.id })
        // Output
        self.presenter.didReceiveUsers(users)
    }
}
