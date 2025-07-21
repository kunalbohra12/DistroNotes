//
//  NotesView.swift
//  DistroNotes
//
//  Created by bd013 on 16/07/25.
//

import SwiftUI
struct CustomerNotesView: View {
    @State var searchTxt = ""
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel : NotesViewModel
    @State var selectedItem : String? = nil
        var body: some View {
        VStack{
            HStack{
                Image("DorasLogoIcon")
                    .resizable()
                    .frame(width:40,height:40)
                Spacer()
                Button(action:{
                    
                }){
                    Image("ReloadSvgIcon")
                        .resizable()
                        .frame(width:24,height: 24)
                }
                Button(action:{
                    
                }){
                    HStack{
                        Text("End Visit")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 100,height: 35)
                    .background(.blueInAssets)
                    .cornerRadius(8)
                    
                }
            }
           
           .frame(maxWidth:.infinity,maxHeight:55)
           .padding(.horizontal,20)
           .border(.lightB,width:2)
            VStack{
                HStack{
                    Text("Customer Notes")
                        .font(.system(size: 18,weight: .semibold))
                        .foregroundStyle(.black)
                    Spacer()
                        Button(action:{
                            router.navigate(to: .AddNotes(isEditing:false, note: nil))
                        }){
                            HStack{
                                Text("Add New Note")
                                    .font(.system(size: 14,weight: .semibold))
                                    .foregroundStyle(.darkBlue)
                            }
                            .frame(width: 120,height: 30)
                            .padding(.horizontal,8)
                            .background(.yellowHighlight)
                            .cornerRadius(8)
                        }
                }
                .padding(.top,12)
                HStack{
                    Image("SearchSvgIcon")
                        .resizable()
                        .frame(width: 22, height: 22)
                    TextField("", text: $searchTxt, prompt: Text("Search notes")
                        .foregroundColor(.grey)
                    )
                    .foregroundColor(.grey)
                    Spacer()
                }
                .frame(maxWidth:.infinity,maxHeight: 40)
                .padding(.horizontal,8)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.littleGrey, lineWidth: 1)
                )
                NotesView()
            }
            .padding(.horizontal,14)
            Spacer()
           
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(.white)
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    CustomerNotesView()
}
