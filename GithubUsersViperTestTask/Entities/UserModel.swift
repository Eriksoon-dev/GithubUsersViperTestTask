import Foundation
import RealmSwift

class UserModel: Object {
    @objc dynamic var id = Int()
    @objc dynamic var login = String()
    @objc dynamic var avatar = String()
    @objc dynamic var name: String? = nil
    @objc dynamic var location: String? = nil
    dynamic var followers = RealmOptional<Int>()
    dynamic var following = RealmOptional<Int>()
    
    override class func primaryKey() -> String? {
        return "login"
    }
}
