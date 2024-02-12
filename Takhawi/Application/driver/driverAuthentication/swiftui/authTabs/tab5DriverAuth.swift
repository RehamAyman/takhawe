//
//  tab5DriverAuth.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/02/2024.
//

import SwiftUI

struct tab5DriverAuth: View {
    @State var serialNumber : String = ""
    var body: some View {
        VStack {
            VStack ( alignment: .leading , spacing: 3) {
                Text ( "1. Locate the Vehicle Serial Number or VIN field.")
                Text ( "2. Locate the 17-digit alphanumeric code on the vehicle or its registration documents.")
                Text ( "2. Enter the serial number accurately.")
                Text ( "4. Submit or save the information to proceed.")
                
            }
            .font(.custom( AppFont.Regular.rawValue , size: 12))
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            
            
            Image ( "Group 1000003064")
                .resizable()
                .frame(width: 100 , height: 80 , alignment: .center)
                .padding()
            FloatingTextField(title: "vehicle serial Number" , text:  $serialNumber )
                 .padding(.horizontal , 10)
             Spacer()
        }
    }
}

#Preview {
    tab5DriverAuth()
}
