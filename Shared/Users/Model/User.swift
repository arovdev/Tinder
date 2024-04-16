//
//  User.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import Foundation
import SwiftUI

struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURLs: [String]
    var bio: String?
    var gender: Gender
}
