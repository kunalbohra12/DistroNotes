//
//  NotesViewModel.swift
//  DistroNotes
//
//  Created by bd013 on 18/07/25.
//

import Foundation
import SwiftUI
struct NotesData: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var type: String
}
class NotesViewModel: ObservableObject {
    @Published var notesData: [NotesData] = []
    func addNote(title: String, type: String) {
        let newNote = NotesData(title: title, type: type)
        notesData.append(newNote)
    }
    func updateNote(id: UUID, newTitle: String, newType: String) {
        if let index = notesData.firstIndex(where: { $0.id == id }) {
            notesData[index].title = newTitle
            notesData[index].type = newType
        }
    }

    
    
}


