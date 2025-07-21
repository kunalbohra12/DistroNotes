//
//  OfficeNotesView.swift
//  DistroNotes
//
//  Created by bd013 on 18/07/25.
//
import SwiftUI

struct EditNotesView: View {
    @EnvironmentObject var router: Router
    let note : NotesData
    @State var notesType:String = ""
    var body: some View {
        VStack{
            HStack{
                Button(action:{
                    router.popToView()
                }){
                    Image("BackBtnArrow")
                        .resizable()
                        .frame(width:24,height:24)
                }

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
            HStack{
                Text("\(note.type)")
                    .font(.system(size: 14,weight: .medium))
                    .foregroundStyle(.darkBlue)
             Spacer()
                Text("05th February 2025 | 10:13:23 AM")
                      .font(.system(size: 14,weight: .medium))
                      .foregroundStyle(.grey)
            }
            .padding(.horizontal,20)
            .padding(.vertical,12)
            VStack(alignment:.leading){
                HStack(alignment:.top){
                    Image("BackgroundImage")
                        .resizable()
                        .frame(width:48,height:48)
                    VStack(alignment:.leading,spacing:10){
                        Text("ios Developer")
                            .font(.system(size: 16,weight: .bold))
                            .foregroundStyle(.darkBlue)
                        Text("Here come some messages ..")
                            .font(.system(size: 14,weight: .regular))
                            .foregroundStyle(.grey)
                    }
                    .padding(.horizontal,8)
                    Spacer()
                    Button(action:{
                        router.navigate(to: .AddNotes(isEditing: true,note: note))
                    }){
                        HStack{
                            Image("VectorPan")
                                .resizable()
                                .frame(width:12,height:12)
                        }
                        .frame(width:30,height: 30)
                        .background(.darkBlue)
                        .cornerRadius(30)
                        .padding(.top,10)
                    }
                }
                Text("\(note.title)")
                    .font(.system(size: 14,weight: .medium))
                    .foregroundStyle(.grey)
            }
            .padding(.horizontal,14)
            Spacer()

        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    EditNotesView(note: note)
//}
