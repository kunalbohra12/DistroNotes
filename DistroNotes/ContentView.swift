//
//  ContentView.swift
//  DistroNotes
//
//  Created by bd013 on 16/07/25.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var router: Router
    @ObservedObject var viewModel: NotesViewModel
    var body: some View {
        NavigationStack(path: $router.path) {
            CustomerNotesView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .AddNotes(let isEditing,let note):
                        AddNotesView(isEditing: isEditing,note: note ?? nil)
                    case .EditNotes(let note):
                        EditNotesView(note: note)
                    case .CustomerNotesView:
                        CustomerNotesView()
                    }
                }
        }
        .environmentObject(viewModel)
        .environmentObject(router)

    }
}

