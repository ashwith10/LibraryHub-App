//
//  Users.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/27/25.
//

import Foundation

struct User {
    var username: String
    var password: String
    var email: String
    var phoneNumber: String
}

var users: [User] = [
    User(username: "shreyesh", password: "pass123", email: "shreyesh@example.com", phoneNumber: "123-456-7890"),
    User(username: "alex", password: "alexpass", email: "alex@example.com", phoneNumber: "234-567-8901"),
    User(username: "emma", password: "emma2025", email: "emma@example.com", phoneNumber: "345-678-9012"),
    User(username: "michael", password: "mike@321", email: "michael@example.com", phoneNumber: "456-789-0123"),
    User(username: "sophia", password: "sophie_pw", email: "sophia@example.com", phoneNumber: "567-890-1234")
]
