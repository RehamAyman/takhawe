//
//  tap1.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct tap1: View {
    @State var email : String = ""
    var body: some View {
        VStack ( spacing: 30) {
          
          Image("arroba 1")
                .resizable()
                .frame(width: 130, height: 130)
            
            TextField( "Enter Your Email Address", text: $email)
               
                .font(.custom(AppFont.Regular.rawValue, size: 14))
                .padding()
                
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                           .stroke(Color("MainColor"), lineWidth: 2)
                )
                .frame(height: 45)
               Spacer()
        }.padding(8)
      
    }
}

struct tap1_Previews: PreviewProvider {
    static var previews: some View {
        tap1()
    }
}
