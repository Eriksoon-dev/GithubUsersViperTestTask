protocol UserDetailsPresenterInput: class {
    var view: UserDetailsPresenterOutput! { get set }
    var interactor: UserDetailsInteratorInput! { get set }
    var router: UserDetailsRouterInput! { get set }
    
    func viewDidLoad()
}
