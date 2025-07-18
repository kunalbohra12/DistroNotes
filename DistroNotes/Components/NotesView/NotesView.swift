//
//  NotesView.swift
//  DistroNotes
//
//  Created by bd013 on 17/07/25.
//

import SwiftUI
struct NotesData:Hashable,Identifiable{
    let id:Int
    let title:String
}
struct NotesView: View {
    @State var selectedItem : String? = nil
    @EnvironmentObject var router:Router
    let notesData: [NotesData] = [
        NotesData(id: 1, title: "First Note"),
        NotesData(id: 2, title: "Second Note")
    ]
    var body: some View {
        ScrollView(showsIndicators:false) {
            LazyVStack {
                ForEach(notesData) { notes in
                    VStack {
                        HStack(alignment: .top) {
                            HStack {
                                Image("BackgroundImage")
                                    .resizable()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(width: 48, height: 48)

                            VStack(alignment: .leading, spacing: 5) {
                                Text("iOS Developer")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.darkBlue)
                                Text("Testing iOS")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.darkBlue)
                            }

                            Spacer()

                            HStack {
                                Text("For Manager")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.white)
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.blueInAssets)
                            .cornerRadius(20)
                        }

                        .padding(.top, 12)
                        .padding(.bottom, 4)

                        HStack {
                            Text("05th February 2025 | 10:13:23 AM")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.grey)
                            Spacer()
                        }

                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)

                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .background(selectedItem == notes.title ? Color.blueInAssets.opacity(0.1) : Color.white)
                    .onTapGesture {
                        selectedItem = notes.title
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            router.navigate(to: .EditNotes)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(selectedItem == notes.title ? Color.blueInAssets : Color.lightB, lineWidth: 2)
                    )
                }
            }
        }
    }
}

#Preview {
    NotesView()
}
