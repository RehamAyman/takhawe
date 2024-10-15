//
//  reportMiddleView.swift
//  Takhawi
//
//  Created by Reham Ayman on 11/04/1446 AH.
//

import SwiftUI

struct reportMiddleView: View {
    @Binding var totalTrips : String
    @Binding var totalProfit : String
    @Binding var totalDistance : String
    
    
    var body: some View {
        VStack ( spacing: 10 ) {
        
            HStack {
                Text ( "Total Trips")
                    .foregroundStyle(.gray)
                Spacer()
                Text ( totalTrips)
                    .foregroundStyle(Color("MainColor"))
            }
            HStack {
                Text ( "Total Profit")
                    .foregroundStyle(.gray)
                Spacer()
                Text ( totalProfit)
                    .foregroundStyle(Color("MainColor"))
            }
            HStack {
                Text ( "Total distance ")
                    .foregroundStyle(.gray)
                Spacer()
                Text ( totalDistance )
                    .foregroundStyle(Color("MainColor"))
            }
        }
            .padding()
            .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arRegular.rawValue :  AppFont.Regular.rawValue , size: 13))
            .background(Color.white)
            .cornerRadius(10)
            .shadow( color: .gray.opacity(0.5) , radius: 5 )
            
            .padding(7 )
           
        
    }
}

#Preview {
    reportMiddleView(totalTrips: .constant("4"), totalProfit: .constant("200 SAR"), totalDistance: .constant("17 km"))
}
