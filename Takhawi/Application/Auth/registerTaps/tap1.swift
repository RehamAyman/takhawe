//
//  tap1.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//



import SwiftUI

struct tap1: View {
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    @Binding var email : String
    var body: some View {
        VStack ( spacing: 12) {
          
          Image("arroba 1")
                .resizable()
         //       .scaledToFit()
                .frame(width: 120, height: 120)
 
            
            
            
            TextField( "Enter Your Email Address".localize, text: $email)
                .font(.custom( LocalizationManager.shared.getLanguage() == .English ?   AppFont.Regular.rawValue : AppFont.arRegular.rawValue , size: 14))
                .padding()
                .frame(height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("MainColor"), lineWidth: 2)
                    .frame(height: 50)
                )
        Spacer()
               
        
        }.padding(8)
        
      
    }
}

struct tap1_Previews: PreviewProvider {
    static var previews: some View {
        tap1(email: Binding.constant(""))
    }
}
