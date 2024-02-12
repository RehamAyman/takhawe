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
    
    
    //
    var body: some View {
        ScrollView(showsIndicators: false) {
           
            Text("Enter more info about your vehicle to help use finding the suitable trip")
                .font(.custom( AppFont.Regular.rawValue , size: 12))
                .padding(10)
                .foregroundColor(Color.black.opacity(0.6))
            
            VStack (spacing: 16 ) {
             
        
                floatingPickerView(placeHolder: "Enter Vehicle Class" , text: $VehicleClass)
                floatingPickerView(placeHolder: "Enter number of seats allocated for the ride" , text: $seatsNumber)
                floatingPickerView(placeHolder: "Enter Vehicle Color" , text: $VehicleColor)
                floatingPickerView(placeHolder: "Choose Vehicle Type" , text: $VehicleType )
                floatingPickerView(placeHolder: "Choose Vehicle Name" , text: $VehicleName )
                floatingPickerView(placeHolder: "Choose Production year" , text: $Productionyear )
                
                
            }
              
           
        }
    }
}

#Preview {
    tab8DriverView()
}
