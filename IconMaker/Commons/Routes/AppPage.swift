//
//  Route.swift
//  IconMaker
//
//  Created by Alberto Almeida on 04/12/24.
//

import SwiftUI

enum AppPage: Hashable {
    case home
    case AddReminder
    case CropImage(value: Image)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .CropImage:
            hasher.combine("cropImage")
        case .home:
            hasher.combine("home")
        case .AddReminder:
            hasher.combine("addReminder")
        }
    }
}

