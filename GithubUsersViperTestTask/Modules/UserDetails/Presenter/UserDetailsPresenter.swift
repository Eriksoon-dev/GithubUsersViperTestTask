class UserDetailsPresenter: UserDetailsPresenterInput {
    weak var view: UserDetailsPresenterOutput!
    var interactor: UserDetailsInteratorInput!
    var router: UserDetailsRouterInput!
    
    var userDetailsData: UserDetailsViewModel!
    
    required init(user: UserViewModel) {
        // before fetching extra data from network we already have main info
        self.userDetailsData = UserDetailsViewModel(login: user.login, avatar: user.avatar)
    }
    
    func viewDidLoad() {
        self.view.updateMajorDetails(details: self.userDetailsData)
        self.interactor.getUserDetails(for: self.userDetailsData.login)
    }
}

extension UserDetailsPresenter: UserDetailsInteractorOutput {
    func didReceiveUserDetails(details: User) {
        self.userDetailsData.name = details.name
        self.userDetailsData.location = details.location
        self.userDetailsData.followers = details.followers
        self.userDetailsData.following = details.following
        
        self.view.updateMinorDetails(details: self.userDetailsData)
    }
}
