protocol UserDetailsRouterInput: class {
    static func loadUserDetailsModule(with user: UserViewModel) -> UserDetailsViewController
    
    var view: UserDetailsViewController! { get set }
}
