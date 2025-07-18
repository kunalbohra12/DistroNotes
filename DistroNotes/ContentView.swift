//
//  ContentView.swift
//  DistroNotes
//
//  Created by bd013 on 16/07/25.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var router: Router
    var body: some View {
        NavigationStack(path: $router.path) {
            CustomerNotesView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .AddNotes:
                        AddNotesView()
                    case .EditNotes:
                        EditNotesView()
                    case .CustomerNotesView:
                        CustomerNotesView()
                    }
                }
        }
        .environmentObject(router)

    }
}

