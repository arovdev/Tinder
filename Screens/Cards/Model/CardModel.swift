//
//  CardModel.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-22.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
