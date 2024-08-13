//
//  driverAuthView.swift
//  Takhawi
//
//  Created by Reham Ayman on 24/01/2024.
//

import SwiftUI
import Neumorphic


struct driverAuthView: View {
   @State var tabSelection : Int = 1 
   @State var carDetails : CarDetailsResult?
    var action: (() -> Void)?
    var BackAction: (() -> Void)?
    @State var nationalIdsImages : [URL] = []
    @State var nationalIdText : String = ""
    @State var drivingLicenseUrls : [URL] = []
    @State var carLicensUrl  : [URL] = []
    @State var profileImage : UIImage?
    @State var carImages : [URL] = []
    @State var carInsuranceimage: [URL] = []
    @State var serialNumber : String = ""
    
    @State var VehicleClass : Int = 0
    @State var seatsNumber : Int = 0
    @State var VehicleColor: Int = 0
    @State var VehicleType:  Int = 0
    @State var VehicleName:  Int = 0
    @State var year : Int = 0
    
    
    @State var A1 : String = ""
    @State var A2 : String = ""
    @State var A3 : String = ""
    @State var n1 : String = ""
    @State var n2 : String = ""
    @State var n3 : String = ""
    @State var n4 : String = ""
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic    {
            return true
        } else {
            return false
        }
    }

    
    var body: some View {
       
            
        ScrollViewReader { proxy in
            ScrollView {
                //  VStack ( alignment: .center ){
                
             
                HStack {
                    Button(action: { self.BackAction?() }, label: {
                        Image("Group 25")
                    })
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top , 50 )
                
                Text ("Driver Profile".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(  (IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 28))
               
              
                
                
                switch tabSelection {
                case 1 :
                    tab1UploadIdView( IDNumber: $nationalIdText, urls: $nationalIdsImages )
                        .tag(1)
                    
                case 2 :
                    tab2DrivingLicenseView( urls: $drivingLicenseUrls)
                        .tag(2)
                case 3:
                    tab3authDriver(urls: $carLicensUrl)
                        .tag(3)
                case 4 :
                    tab4DriverAuthView(profileImage: $profileImage)
                        .tag(4)
                    
                case 5 :
                    tab7DriverAuth( urls: $carImages)
                        .tag(5)
                    
                case 6:
                    carInsuranceView(urls:$carInsuranceimage)
                    
                case 7 :
                    tab5DriverAuth(serialNumber: $serialNumber)
                        .tag(7)
                case 8 :
                    tab6DriverAuth(AOne: $A1, ATwo: $A2, AThree: $A3 , pinOne : $n1 , pinTwo : $n2 , pinThree : $n3 , pinFour : $n4 )
                        .tag(8)
                    
                case 9 :
                    tab8DriverView( VehicleClass: $VehicleClass, seatsNumber: $seatsNumber, VehicleColor: $VehicleColor , VehicleType: $VehicleType , VehicleName: $VehicleName, year: $year ,carDetails: carDetails)
                        .tag(9)
                    
                    
                default:
                    
                    tab1UploadIdView( IDNumber: $nationalIdText, urls: $nationalIdsImages)
                        .tag(1)
                }
                
                
                //                TabView ( selection: $tabSelection ) {
                //                    tab1UploadIdView()
                //                        .tag(1)
                //                    tab2DrivingLicenseView()
                //                        .tag(2)
                //                    tab3authDriver()
                //                        .tag(3)
                //                    tab4DriverAuthView()
                //                        .tag(4)
                //                    tab5DriverAuth()
                //                        .tag(5)
                //                    tab6DriverAuth()
                //                        .tag(6)
                //                    tab7DriverAuth()
                //                        .tag(7)
                //                    tab8DriverView()
                //                        .tag(8)
                //                }
                //                .frame(height: UIScreen.main.bounds.size.height * 0.45)
                //                .tabViewStyle(.page(indexDisplayMode: .never))
                //                .onChange(of: tabSelection) { newtabSelection in
                //                    self.Validation(newTab: newtabSelection)
                //
                //                }
                
                //    .padding(.bottom , 20)
                // Spacer(minLength: 20)
                
                VStack {
                    HStack ( spacing: 10) {
                        ForEach((1...9), id: \.self) { item in
                            Circle()
                                .fill( item == tabSelection ? Color( "MainColor") : Color.Neumorphic.main   ).softOuterShadow()
                                .frame(width: 15 , height: 15 , alignment: .center)
                        }
                    }
                    .padding()
                    
                    Button {
                       
                            self.goToNextAction()
                           
                       
                    } label: {
                        Text( tabSelection == 9 ? "Create Account".localize : "Next".localize)
                            .font(.custom(IsArabicLang ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 20))
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(Color("MainColor"))
                            .cornerRadius(27.5)
                            .padding(25)
                            .padding(.bottom , 30 )
                            .shadow(color: Color("MainColor").opacity(0.6), radius: 3 , x: 0 , y: 3)
                    }
                }
                .padding(.top , 20 )
                //  .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .center)
                
                
                
                
            }
            
            .background(Color ("BackGroundColor" ))
            .environment(\.layoutDirection,   .leftToRight  )
            
        }
        .onAppear {
            print("🥳🥳🥳🥳on appear function 🥳🥳🥳🥳")
            self.getCarDetails()
        }
    }
       
}






let englishToArabicMapping: [Character: Character] = [
    "a": "ا",
    "b": "ب",
    "c": "ج",
    "d": "د",
    "e": "ه",
    "f": "و",
    "g": "ز",
    "h": "ح",
    "i": "ط",
    "j": "ي",
    "k": "ك",
    "l": "ل",
    "m": "م",
    "n": "ن",
    "o": "س",
    "p": "ع",
    "q": "ف",
    "r": "ص",
    "s": "ق",
    "t": "ر",
    "u": "ش",
    "v": "ت",
    "w": "ث",
    "x": "خ",
    "y": "ذ",
    "z": "ض"
]

// Function to convert English text to Arabic text
func convertToArabic(text: String) -> String {
    return String(text.lowercased().compactMap { englishToArabicMapping[$0] })
}

//// Example usage
//let englishText = "hello"
//let arabicText = convertToArabic(text: englishText)
//print(arabicText) // Output: "هللو"
