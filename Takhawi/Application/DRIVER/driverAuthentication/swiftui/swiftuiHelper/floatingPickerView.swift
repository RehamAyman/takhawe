//
//  floatingPickerView.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/02/2024.
//

import SwiftUI

struct floatingPickerViews: View {
   // var placeHolder : String
    @Binding var selectedClass : Int
    @Binding var selectedSeatNum : Int
    @Binding var selectedColor : Int
    @Binding var selectedType : Int
    @Binding var selectedName : Int
    @Binding var selectedYear : Int
    
    @State var vehicleClassText  : String = ""
    @State var selectedNum : Int = 0
    @State var seatNumText : String = ""
    @State var colorText : String = ""
    @State var carType : String = ""
    @State var carName : String  = ""
    @State var yearText : String  = ""
    @Binding var carDetails : CarDetailsResult?
   
    @State var seatsNum : [Int] = [1,2,3,4,5,6,7,8,9,10]
   
    
    let currentYear = Calendar.current.component(.year, from: Date())

    // Create an array containing years from 2011 to the current year
   
   
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    
    var filteredVehicleClasses: [VehicleClass] {
        guard let vehicleClasses = carDetails?.vehicleClass else { return [] }
        
        if carName.isEmpty {
            return vehicleClasses
        } else {
            return vehicleClasses.filter {
                $0.name?.lowercased().contains(carName.lowercased()) ?? false
            }
        }
    }
    
    
    
    
    var body: some View {
        
        if let carDetails = carDetails {
           
                
                // 2
                
                Menu {
                    ForEach ( seatsNum  , id: \.self ) { item in
                        Button( "\(item )" , action: {
                            self.selectedSeatNum =  item
                            self.seatNumText = "\(item)" + "seats".localize
                        })
                    }
                    
                } label: {
                    ZStack ( alignment: IsArabicLang ? .leading : .trailing    ) {
                        FloatingSecTextField(title:  "Enter number of seats allocated for the ride".localize , text: $seatNumText)
                  
                        Image ( "Vector 9")
                            .resizable()
                            .frame(width: 14 , height: 11)
                            .padding( .horizontal ,30)
                    }
                    .frame(height: 50)
                }
                
                
                // 3
                
                Menu {
                    ForEach ( carDetails.vehicleColor ?? []   , id: \.id ) { item in
                        Button( item.name ?? ""  , action: {
                            self.selectedColor =  item.id ?? 0
                            self.colorText = item.name ?? "" 
                        })
                    }
                    
                } label: {
                    ZStack ( alignment: IsArabicLang ? .leading : .trailing   ) {
                       
                        FloatingSecTextField(title: "Enter Vehicle Color".localize , text: $colorText)
                        
                        Image ( "Vector 9")
                            .resizable()
                            .frame(width: 14 , height: 11)
                            .padding( .horizontal ,30)
                    }
                    .frame(height: 50)
                }
                
                
                // 4 
                Menu {
                    ForEach ( carDetails.vehicleTypes ?? []   , id: \.id ) { item in
                        Button( item.name ?? ""  , action: {
                            self.selectedType =  item.id ?? 0
                            self.carType = item.name ?? ""
                        })
                    }
                    
                } label: {
                    ZStack ( alignment: IsArabicLang ? .leading : .trailing   ) {
                        FloatingSecTextField(title: "Choose Vehicle Type".localize , text: $carType)
                        
                        Image ( "Vector 9")
                            .resizable()
                            .frame(width: 14 , height: 11)
                            .padding( .horizontal ,30)
                    }
                    .frame(height: 50)
                }
                
                
                // 5
                Menu {
                    ForEach ( carDetails.vehicleName ?? []   , id: \.id ) { item in
                        Button( item.name ?? ""  , action: {
                            self.selectedName =  item.id ?? 0
                            self.carName = item.name ?? ""
                            self.selectedClass =  0
                            self.vehicleClassText =  ""
                            
                        })
                    }
                    
                } label: {
                    ZStack ( alignment: IsArabicLang ? .leading : .trailing  ) {
                        FloatingSecTextField(title: "Choose Vehicle Name".localize , text: $carName)
                        
                        Image ( "Vector 9")
                            .resizable()
                            .frame(width: 14 , height: 11)
                            .padding( .horizontal ,30)
                    }
                    .frame(height: 50)
                }
            
            
                
            
            // 1
            
            VStack (spacing: 16 ) {
                Menu {
                    // carDetails.vehicleClass ?? []
                    ForEach (  filteredVehicleClasses  , id: \.id ) { item in
                        Button( item.name ?? ""  , action: {
                            self.selectedClass = item.id ?? 0
                            self.vehicleClassText = item.name ?? ""
                        })
                    }
                    
                } label: {
                    ZStack ( alignment: IsArabicLang ?  .leading : .trailing   ) {
                        FloatingSecTextField(title:  "Enter Vehicle Class".localize , text: $vehicleClassText)
                     //   FloatingTextField(title: "Enter Vehicle Class".localize , text: $vehicleClassText)
                        
                        Image ( "Vector 9")
                            .resizable()
                            .frame(width: 14 , height: 11)
                            .padding( .horizontal ,30)
                    }
                    .frame(height: 50)
                }
                
                // 6
                
                Menu {
                    let start_year = carDetails.start_year ?? 2000
                    ForEach (  (start_year...currentYear).map { String($0) }   , id: \.self ) { item in
                        Button( item , action: {
                            self.selectedYear =  Int ( item ) ?? 2011
                            self.yearText =  item
                        })
                    }
                    
                } label: {
                    ZStack ( alignment: IsArabicLang ? .leading : .trailing  ) {
                        FloatingSecTextField(title: "Choose Production year".localize , text: $yearText)
                        
                        Image ( "Vector 9")
                            .resizable()
                            .frame(width: 14 , height: 11)
                            .padding( .horizontal ,30)
                    }
                    .frame(height: 50)
                }
                
            }
        }
    }
    
    
    
    
    private func filterStringsStartingWith(from array: [String], startingWith searchText: String) -> [String] {
        return array.filter { $0.lowercased().hasPrefix(searchText.lowercased()) }
    }
}
