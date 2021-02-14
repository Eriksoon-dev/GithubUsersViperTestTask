struct UserDetail: Decodable {
    var login: String
    var avatar: String
    var name: String
    var location: String
    var followers: Int
    var following: Int
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatar = "avatar_url"
        case name
        case location
        case followers
        case following
    }
}
