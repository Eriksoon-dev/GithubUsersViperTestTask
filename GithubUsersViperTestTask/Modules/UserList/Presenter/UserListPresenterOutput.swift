protocol UserListPresenterOutput: class {
    func updateUsers(_ users: [UserViewModel])
    func setLoading(isLoading: Bool)
}
