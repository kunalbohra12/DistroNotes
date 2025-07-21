//
//  DistroNotesApp.swift
//  DistroNotes
//
//  Created by bd013 on 16/07/25.
//

import SwiftUI

@main
struct DistroNotesApp: App {
    @StateObject private var router = Router()
    @StateObject private var viewModel = NotesViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(router: router, viewModel: viewModel)
        }
    }
}
