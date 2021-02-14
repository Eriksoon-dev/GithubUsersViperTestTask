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

struct UserViewModel {
    var login: String
    var avatar: String
}

class UserDetailsViewModel {
    var login: String
    var avatar: String
    var name: String?
    var location: String?
    var followers: Int?
    var following: Int?
    
    init(login: String, avatar: String) {
        self.login = login
        self.avatar = avatar
    }
    
    var nameLabel: String {
        return "\(self.location ?? "Unknown")"
    }
    
    var locationLabel: String {
        return "Location: \(self.location ?? "Unknown")"
    }
    
    var followersLabel: String {
        return self.followers != nil ? String(self.followers!) : "--"
    }
    
    var followingLabel: String {
        return self.following != nil ? String(self.following!) : "--"
    }
}
