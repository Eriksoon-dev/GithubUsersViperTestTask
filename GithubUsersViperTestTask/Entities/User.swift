struct User: Decodable {
    var login: String
    var avatar: String
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatar = "avatar_url"
    }
}
