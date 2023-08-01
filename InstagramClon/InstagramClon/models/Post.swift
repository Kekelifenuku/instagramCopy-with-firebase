//
//  Post.swift
//  InstagramClon
//
//  Created by Fenuku kekeli on 7/29/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
static var MOCK_POSTS: [Post] = [
.init( id: NSUUID() .uuidString,
ownerUid: NSUUID() .uuidString,
caption: "This is some test caption for now",
likes: 123,
imageUrl: "gifty1",
timestamp: Timestamp(),
user: User.MOCK_USERS[0]
),
.init( id: NSUUID() .uuidString,
ownerUid: NSUUID() .uuidString,
caption: "This is some test caption for now",
likes: 123,
imageUrl: "gifty2",
timestamp: Timestamp(),
user: User.MOCK_USERS[0]
),
.init( id: NSUUID() .uuidString,
ownerUid: NSUUID() .uuidString,
caption: "This is some test caption for now",
likes: 123,
imageUrl: "gifty3",
timestamp: Timestamp(),
user: User.MOCK_USERS[0]
),
.init( id: NSUUID() .uuidString,
ownerUid: NSUUID() .uuidString,
caption: "This is some test caption for now",
likes: 123,
imageUrl: "pappy",
timestamp: Timestamp(),
user: User.MOCK_USERS[0]
),
.init( id: NSUUID() .uuidString,
ownerUid: NSUUID() .uuidString,
caption: "This is some test caption for now",
likes: 123,
imageUrl: "kekeli",
timestamp: Timestamp(),
user: User.MOCK_USERS[0]
)
]
}
