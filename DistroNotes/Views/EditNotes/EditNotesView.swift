//
//  OfficeNotesView.swift
//  DistroNotes
//
//  Created by bd013 on 18/07/25.
//

import SwiftUI

struct EditNotesView: View {
    @EnvironmentObject var router: Router
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
              Text("For Office")
                    .font(.system(size: 14,weight: .medium))
                    .foregroundStyle(.darkBlue)
             Spacer()
                Text("05th February 2025 | 10:13:23 AM")
                      .font(.system(size: 14,weight: .medium))
                      .foregroundStyle(.grey)
            }
            .padding(.horizontal,20)
            .padding(.vertical,12)

            Spacer()

        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EditNotesView()
}
