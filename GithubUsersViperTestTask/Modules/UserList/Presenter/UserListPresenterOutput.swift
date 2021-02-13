protocol UserListPresenterOutput: class {
    func updateUsers(_ users: [User])
    func setLoading(isLoading: Bool)
}
