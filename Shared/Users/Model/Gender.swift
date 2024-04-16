//
//  Gender.swift
//  Tinder
//
//  Created by Arthur Reshetnyak on 2024-03-23.
//

import Foundation

enum Gender {
    case male
    case female
    
    var name: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
}
