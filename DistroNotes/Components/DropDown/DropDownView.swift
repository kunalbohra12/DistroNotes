//
//  DropDownView.swift
//  DistroNotes
//
//  Created by bd013 on 16/07/25.
//

import SwiftUI
struct DropDownView: View {
    @Binding var selectedText : String
    @Binding var isDropDown : Bool
    let items = ["For Driver", "For Manager", "For Office", "General"]
    var body: some View {
        VStack(spacing:12){
            ForEach(items, id: \.self){ item in
                Button(action:{
                    selectedText = item
                    isDropDown = false
                }){
                    HStack(spacing:20){
                        Image(selectedText == item ? "CheckCircleWithBorderIcon" : "BlankControlsBtn" )
                            .resizable()
                            .frame(width: 35, height: 35)
                        Text(item)
                            .font(.system(size: 22,weight: .semibold))
                            .foregroundColor(.grey)
                        Spacer()
                    }
                }
              
            }
        }
        .frame(maxWidth:.infinity)
        .padding(.horizontal,14)
        .padding(.vertical,30)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.grey, lineWidth: 2)
        )
        .cornerRadius(8)
    }
}
#Preview {
    DropDownView(
        selectedText: .constant(""),
        isDropDown: .constant(true) 
    )
}
