//
//  tab4.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/09/2023.
//

import SwiftUI

struct tab4: View {
    @Binding var fullName : String
    // @Binding
    @Binding  var birthdate : Date
    
    
    var body: some View {
        VStack {
         Image ( "id-card 1")
                .resizable()
                .frame(width:  UIScreen.main.bounds.width * 0.3)
                .frame(height:  UIScreen.main.bounds.height * 0.15)
            
            DatePicker("Birthdate".localize, selection: $birthdate, in: ...Date(), displayedComponents: .date)
                          // .labelsHidden() // Hide the label for a cleaner UI
                           .padding()
            
            
            TextField( "Enter Your Full Name".localize , text: $fullName )
                
                .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arRegular.rawValue :  AppFont.Regular.rawValue , size: 14))
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

