protocol UserListPresenterInput: class {
    var view: UserListPresenterOutput! { get set }
    var interactor: UserListInteractorInput! { get set }
    var router: UserListRouterInput! { get set }
    
    func viewDidLoad()
    func showUserDetails(user: UserViewModel)
}
