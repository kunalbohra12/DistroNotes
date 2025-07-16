//
//  NavManager.swift
//  Clot
//
//  Created by bd013 on 22/05/25.
//

import Foundation
enum Route: Hashable {
    case Splash
    case SignUp
    case Login
    case Home
    case TabBar
    case Onboarding
}

import SwiftUI
class Router: ObservableObject {
    @Published var path = NavigationPath()
    func navigate(to route: Route) {
        path.append(route)
    }

    func navigateToRoot() {
        path.removeLast(path.count)
    }

    func popToView() {
          guard !path.isEmpty else { return }
          path.removeLast()
    }
}
