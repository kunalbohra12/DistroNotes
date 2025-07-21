//
//  NotesView.swift
//  DistroNotes
//
//  Created by bd013 on 17/07/25.
//

import SwiftUI
struct NotesView: View {
    @State var selectedNotedId : UUID? = nil
    @EnvironmentObject var router:Router
    @EnvironmentObject var viewModel:NotesViewModel
    var body: some View {
            List {
                ForEach(viewModel.notesData) { notes in
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
                                
                                Text(notes.title)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.darkBlue)
                            }
                            Spacer()
                            HStack {
                                Text(notes.type)
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
                    
                    .background(selectedNotedId == notes.id ? Color.blueInAssets.opacity(0.1) : Color.white)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(selectedNotedId == notes.id ? Color.blueInAssets : Color.lightB, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedNotedId = notes.id
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            router.navigate(to: .EditNotes(notes))
                        }
                    }
                    .padding(.bottom,8)
                    .swipeActions(edge: .leading) {
                                    deleteAction()
                                }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
    }
    private func deleteAction() -> some View {
        Button(role: .destructive) {
            // Handle delete action
        } label: {
            VStack {
                Image(systemName: "wrongwaysign.fill")
                Text("Delete")
            }
        }
        .tint(.red)
    }
}

