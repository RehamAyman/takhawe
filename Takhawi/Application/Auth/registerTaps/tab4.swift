//
//  tab4.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/09/2023.
//

import SwiftUI

struct tab4: View {
    @State var fullName : String = ""
    var body: some View {
        VStack {
         Image ( "id-card 1")
                .resizable()
                .frame(width:  UIScreen.main.bounds.width * 0.3)
                .frame(height:  UIScreen.main.bounds.height * 0.15)
            
            TextField( "Enter Your Full Name" , text: $fullName )
                .font(.custom(AppFont.Regular.rawValue, size: 14))
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25 )
                               .stroke(Color("MainColor"), lineWidth: 2)
                    )
                    .frame(height: 45)
                    .padding(8)
                    .padding(.top)
            Spacer()
        }
    }
}

struct tab4_Previews: PreviewProvider {
    static var previews: some View {
        tab4()
    }
}
