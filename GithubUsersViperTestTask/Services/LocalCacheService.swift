import Foundation
import RealmSwift

class LocalCacheService {
    static let shared = LocalCacheService()
    
    private let realm = try! Realm()
    
    func saveUsersToCache(_ entities: [UserModel]) {
        for entity in entities {
            try! realm.write {
                if realm.object(ofType: UserModel.self, forPrimaryKey: entity.login) == nil {
                    realm.add(entity)
                } else {
                    realm.create(UserModel.self, value: ["id": entity.id, "login": entity.login, "avatar": entity.avatar], update: .modified)
                }
            }
        }
    }
    
    func saveUserDetailsToCache(_ entity: UserModel) {
        try! realm.write {
            if realm.object(ofType: UserModel.self, forPrimaryKey: entity.login) == nil {
                realm.add(entity)
            } else {
                realm.add(entity, update: .modified)
            }
        }
    }
    
    func loadFromCache(key: String? = nil) -> [UserModel] {
        if let key = key {
            let model: UserModel = realm.object(ofType: UserModel.self, forPrimaryKey: key)!
            return [model]
        } else {
            return Array(realm.objects(UserModel.self))
        }
    }
}
