//
//  AddNotesView.swift
//  DistroNotes
//
//  Created by bd013 on 16/07/25.
//

import SwiftUI
import PhotosUI
struct NoteData: Identifiable {
    var id: UUID = UUID()
    var notesTx: String
    var notestype:String
}
struct AddNotesView: View {
    @State var message = ""
    @State private var selectedImages: [UIImage] = []
    @State var selectedText = "Select an option"
    @State var isDropdown: Bool = false
    @State var showImagePicker: Bool = false
    @State  var textHeight: CGFloat = 100
    let maxLines: Int = 10
    @State var noteTxt = ""
    let options = ["For Driver", "For Manager", "For Office", "General"]
    @EnvironmentObject var router: Router
    var isFormValid: Bool{
        selectedText != nil || noteTxt.isEmpty
    }
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Button(action:{
                        router.popToView()
                    }){
                        Image("BackBtnArrow")
                            .resizable()
                            .frame(width:24,height:24)
                    }
                    Text("Add New Note")
                        .foregroundStyle(.darkBlue)
                        .font(.system(size:20,weight: .medium))
                    Spacer()
                }
                HStack{
                    Image("ReloadSvgIcon")
                        .resizable()
                        .frame(width:20,height:20)
                    Button(action:{}){
                        HStack{
                            Text("End Visit")
                                .foregroundStyle(Color.white)
                        }
                        .frame(width: 85,height: 30)
                        .padding(2)
                        .background(Color.blue)
                        .border(.grey,width: 2)
                        .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal,14)
            Divider()
                .frame(maxWidth:.infinity,maxHeight: 1)
                .background(Color.grey)
            VStack(alignment: .leading){
                Text("Note Subject")
                    .font(.system(size:14,weight: .medium))
                    .foregroundStyle(.darkBlue)
                HStack{
                    Text(selectedText == "" ? "Select Note Subject" : selectedText)
                        .font(.system(size: 16,weight: .medium))
                        .foregroundStyle(.grey)
                    Spacer()
                    Button(action:{
                        isDropdown.toggle()
                    }){
                        HStack{
                            Image("ArrowDown")
                                .resizable()
                                .frame(width:24,height:24)
                        }
                    }
                }
                .frame(maxWidth:.infinity,maxHeight: 50)
                .padding(.horizontal,14)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.textFieldGrey, lineWidth: 2)
                )
                ZStack{
                    VStack(alignment:.leading){
                        Text("Merchandiser Signature:")
                            .font(.system(size:14,weight: .medium))
                            .foregroundStyle(.darkBlue)
                        TextEditor(text: $noteTxt)
                            .frame(maxWidth:.infinity,maxHeight: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.grey, lineWidth: 1)
                            )
                    }
                    .padding(.top,10)
                    if isDropdown {
                        DropDownView(selectedText: $selectedText, isDropDown: $isDropdown)
                            .padding(.top,10)

                    }
                }
                .background(.white)
                HStack{
                    ForEach(selectedImages, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
              
                HStack{
                    Spacer()
                    Button(action:{
                        showImagePicker.toggle()
                    }){
                        HStack{
                            Text("Upload Picture")
                                .foregroundStyle(Color.white)
                        }
                        .padding(.horizontal,15)
                        .padding(.vertical,10)
                        .background(Color.blue)
                    }
                    
                    .sheet(isPresented: $showImagePicker) {
                              ImagePicker(sourceType: .photoLibrary) { image in
                                  selectedImages.append(image)
                              }
                          }
                }
                .padding(.top,5)
              
                Button(action:{}){
                    HStack{
                        Text("Submit")
                            .foregroundStyle(Color.white)
                    }
                    .frame(maxWidth:.infinity,maxHeight: 50)
                    .background(Color.darkBlue)
                    .border(.textFieldGrey,width:2)
                    .cornerRadius(12)
                    .padding(.top,12)
                }
                .disabled(!isFormValid)
                
                
                Spacer()
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .padding(.top,20)
            .padding(.horizontal,14)
            .background(Color.white)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(.white)
        .navigationBarBackButtonHidden(true)
        
    
    }
}
#Preview {
    AddNotesView()
}
