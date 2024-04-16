//
//  MockData.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullname: "Kate",
            age: 19,
            profileImageURLs: ["female-blacksy-1", "female-blacksy-2", "female-blacksy-3", "female-blacksy-4"],
            bio: "Hi, I'm Kate, I love traveling and cooking pasta.",
            gender: .female
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Karina",
            age: 22,
            profileImageURLs: ["female-brown-1", "female-brown-2", "female-brown-3", "female-brown-4"],
            bio: "Hi, I'm Karina, dreaming to become an artist.",
            gender: .female
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Linda",
            age: 16,
            profileImageURLs: ["female-school-1", "female-school-2", "female-school-3"],
            bio: "Hi, I'm Linda, passionate about sports.",
            gender: .female
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Victoria",
            age: 18,
            profileImageURLs: ["female-tsh-1", "female-tsh-2", "female-tsh-3"],
            bio: "Hi, I'm Victoria, I love reading and traveling.",
            gender: .female
        ),
        .init(
            id: NSUUID().uuidString,
            fullname: "Dana",
            age: 17,
            profileImageURLs: ["female-basketball-1", "female-basketball-2", "female-basketball-3"],
            bio: "Hi, I'm Dana! I love playing basketball and learning new things.",
            gender: .female
        )
    ]
}
