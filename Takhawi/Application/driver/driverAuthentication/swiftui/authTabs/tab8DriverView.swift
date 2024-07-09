//
//  tab8DriverView.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/02/2024.
//

import SwiftUI

struct tab8DriverView: View {
    
    // vars
    @State var VehicleClass : String = ""
    @State var seatsNumber : String = ""
    @State var VehicleColor: String = ""
    @State var VehicleType: String = ""
    @State var VehicleName: String = ""
    @State var Productionyear: String = ""
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    //
    var body: some View {
        ScrollView(showsIndicators: false) {
           
            Text("Enter more info about your vehicle to help use finding the suitable trip".localize)
               
                .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 12))
                .padding(10)
                .foregroundColor(Color.black.opacity(0.6))
            
            VStack (spacing: 16 ) {
             
        
                floatingPickerView(placeHolder: "Enter Vehicle Class".localize , text: $VehicleClass)
                floatingPickerView(placeHolder: "Enter number of seats allocated for the ride".localize , text: $seatsNumber)
                floatingPickerView(placeHolder: "Enter Vehicle Color".localize , text: $VehicleColor)
                floatingPickerView(placeHolder: "Choose Vehicle Type".localize , text: $VehicleType )
                floatingPickerView(placeHolder: "Choose Vehicle Name".localize , text: $VehicleName )
                floatingPickerView(placeHolder: "Choose Production year".localize , text: $Productionyear )
                
                
            }
              
           
        }
    }
}

#Preview {
    tab8DriverView()
}
