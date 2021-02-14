struct User: Decodable {
    var id: Int
    var login: String
    var avatar: String
    var name: String?
    var location: String?
    var followers: Int?
    var following: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatar = "avatar_url"
        case name
        case location
        case followers
        case following
    }
    
    func convertToModel() -> UserModel {
        let model = UserModel()
        
        model.id = self.id
        model.login = self.login
        model.avatar = self.avatar
        model.name = self.name
        model.location = self.location
        model.followers.value = self.followers
        model.following.value = self.following
        
        return model
    }
}
