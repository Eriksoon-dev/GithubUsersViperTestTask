protocol UserListInteractorInput: class {
    var presenter: UserListInteractorOutput! { get set }
    func getUsers()
}
