//
//  File.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/28/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable,  Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String

var isCurrentUser: Bool {
    guard let currentUid = Auth.auth().currentUser?.uid else { return false }
    return currentUid == id
}

}
extension User {
static var MOCK_USERS: [User] = [
    .init(id: NSUUID() .uuidString, username: "kekeli", profileImageUrl: nil ,fullname: "kekeli fenuku", bio: "Gotham's Dark Knight",email: "kekeli@gmail.com"),
    .init(id: NSUUID() .uuidString, username: "gifty1", profileImageUrl: nil ,fullname: "kekeli fenuku", bio: "Gotham's Dark Knight",email: "gifty1@gmail.com"),
    .init(id: NSUUID() .uuidString, username: "pappy", profileImageUrl: nil ,fullname: "kekeli fenuku", bio: "Gotham's Dark Knight",email: "pappy@gmail.com"),
    .init(id: NSUUID() .uuidString, username: "gifty2", profileImageUrl: nil ,fullname: "kekeli fenuku", bio: "Gotham's Dark Knight",email: "gifty2@gmail.com"),
    .init(id: NSUUID() .uuidString, username: "gifty3", profileImageUrl: nil ,fullname: "kekeli fenuku", bio: "Gotham's Dark Knight",email: "gifty3@gmail.com")
]
    }
