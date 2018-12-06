//
//  User.swift
//  StackOverflowSampleProject
//
//  Created by dylan.bruschi on 12/6/18.
//  Copyright © 2018 dylan.bruschi. All rights reserved.
//

import Foundation

struct User: Codable {
    let userId: Int
    let profileImage: String
    let username: String?

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case profileImage = "profile_image"
        case username = "display_name"
    }
}
