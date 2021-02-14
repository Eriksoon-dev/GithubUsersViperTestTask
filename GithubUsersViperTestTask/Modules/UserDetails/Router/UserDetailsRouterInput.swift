protocol UserDetailsRouterInput: class {
    static func loadUserDetailsModule(with identifier: String) -> UserDetailsViewController
    
    var view: UserDetailsViewController! { get set }
}
