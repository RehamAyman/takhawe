//
//  tab8DriverView.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/02/2024.
//

import SwiftUI

struct tab8DriverView: View {
    
    // vars
    @Binding var VehicleClass : Int
    @Binding var seatsNumber : Int
    @Binding var VehicleColor: Int
    @Binding var VehicleType:  Int
    @Binding var VehicleName:  Int 
    @Binding var year : Int 
    var startyear : Int = 2000
    
    @State var carDetails : CarDetailsResult?
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }

    
    var body: some View {
       VStack {
           
            Text("Enter more info about your vehicle to help use finding the suitable trip".localize)
                .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 12))
                .padding(10)
                .foregroundColor(Color.black.opacity(0.6))
            
            VStack (spacing: 16 ) {
                
                floatingPickerViews( selectedClass: $VehicleClass, selectedSeatNum: $seatsNumber, selectedColor: $VehicleColor , selectedType: $VehicleType , selectedName: $VehicleName, selectedYear: $year   , carDetails: self.carDetails )
        
//                floatingPickerView(placeHolder: "Enter Vehicle Class".localize , text: $VehicleClass , carDetails: self.carDetails)
//                floatingPickerView(placeHolder: "Enter number of seats allocated for the ride".localize , text: $seatsNumber)
//                floatingPickerView(placeHolder: "Enter Vehicle Color".localize , text: $VehicleColor)
//                floatingPickerView(placeHolder: "Choose Vehicle Type".localize , text: $VehicleType )
//                floatingPickerView(placeHolder: "Choose Vehicle Name".localize , text: $VehicleName )
//                floatingPickerView(placeHolder: "Choose Production year".localize , text: $Productionyear )
//                
                
            }
        }
    }
}

