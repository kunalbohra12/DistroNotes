//
//  FirestoreManager.swift
//  DistroNotes
//
//  Created by bd013 on 23/07/25.
//

//import Foundation
//import SwiftUI
//import Firebase
//import FirebaseFirestore
//class FirestoreManager: ObservableObject {
//    @EnvironmentObject var viewModel: NotesViewModel
//    func fetchRestaurant() {
//        
//        let db = Firestore.firestore()
//
//        let docRef = db.collection("Restaurants").document("PizzaMania")
//
//        docRef.getDocument { (document, error) in
//            guard error == nil else {
//                print("error", error ?? "")
//                return
//            }
//
//            if let document = document, document.exists {
//                let data = document.data()
//                if let data = data {
//                    print("data", data)
//                    self.viewModel.notesData = data[""]
//                }
//            }
//
//        }
//    }
//}
