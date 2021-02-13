protocol UserListRouterInput: class {
    static func loadUserListModule() -> UserListViewController
    
    var view: UserListViewController! { get set }
}
