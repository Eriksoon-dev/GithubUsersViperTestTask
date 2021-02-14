protocol UserDetailsInteratorInput: class {
    var presenter: UserDetailsInteractorOutput! { get set }
    func getUserDetails(for identifier: String)
}
