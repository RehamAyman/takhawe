//
//  tab5DriverAuth.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/02/2024.
//

import SwiftUI

struct tab5DriverAuth: View {
    @State var serialNumber : String = ""
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            VStack ( alignment: .leading , spacing: 3) {
                Text ( "1. Locate the Vehicle Serial Number or VIN field.".localize)
                Text ( "2. Locate the 17-digit alphanumeric code on the vehicle or its registration documents.".localize)
                Text ( "3. Enter the serial number accurately.".localize)
                Text ( "4. Submit or save the information to proceed.".localize)
                
            }
            .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 12))
            
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
            
            
            Image ( "Group 1000003064")
                .resizable()
                .frame(width: 100 , height: 80 , alignment: .center)
                .padding()
            FloatingTextField(title: "vehicle serial Number".localize , text:  $serialNumber )
                 .padding(.horizontal , 10)
             Spacer()
        }
    }
}

#Preview {
    tab5DriverAuth()
}
