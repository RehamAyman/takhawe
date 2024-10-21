//
//  addNewCarSwiftui.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//
// loc check
import SwiftUI

struct addNewCarSwiftui: View {
    @State var IDNumber : String  = ""
    @State var DriverIdUrls : [URL] = []
    @State var DrivingLicensUrls : [URL] = []
    @State var carRegisterationUrls  : [URL] = []
    @State var serialNum : String = ""
    @State var VehicleAlphabetText : String = ""
    @State var carUrls : [URL] = []
    //Vehicle alphapit
    @State var AOne: String = ""
    @State var ATwo: String = ""
    @State var AThree: String = ""
    @State var AFour: String = ""
    
    // Vehicle Number
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var VehicleClass : Int = 0
    @State var seatsNumber : Int = 0
    @State var VehicleColor: Int = 0
    @State var VehicleType:  Int = 0
    @State var VehicleName:  Int = 0
    @State var year : Int = 0
    @State var carDetails : CarDetailsResult?
    
    
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading ) {
                
//MARK: -  driver id section
                Text("Driver ID".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                    .padding(.bottom , 5)
                uploadingSection( urls: $DriverIdUrls, titleText: .constant("Please Upload Your ID ".localize))
                FloatingTextField(numKeyboard: true, title: "Enter Your ID Number".localize , text:  $IDNumber   )
            Divider()
                
//MARK: -  driver license section
                
                Text("Driving License".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                    .padding(.bottom , 5)
                uploadingSection( urls: $DrivingLicensUrls, titleText: .constant("Please Upload Your Driving License".localize))
              
                Divider()
                
                
//MARK: -  driver license section
                
                
                Text("Vehicle Registration".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                    .padding(.bottom , 5)
                uploadingSection( urls: $carRegisterationUrls, titleText: .constant("Please Upload Your Vehicle Registration".localize))
                
                Divider()
//MARK: -  serial number section
                
                Text("Serial Number".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                
                FloatingTextField(numKeyboard: false , title: "vehicle serial Number".localize , text:  $serialNum   )
//MARK: -  Vehicle Number Plate section
                Text("Vehicle Number Plate".localize)
                
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                VStack ( alignment: .center )  {
                  
                    
                    Text ( "Vehicle Alphabet".localize)
                        .font(.custom(( LocalizationManager.shared.getLanguage() == .Arabic  ? AppFont.arBold : AppFont.Bold).rawValue , size: 14))
                        
                        .padding(.top)
                   
                    OtpFormFieldView(pinOne: $AOne, pinTwo: $ATwo, pinThree: $AThree, pinFour: $AFour , numKeyboard: false  , threeItems: true)
                        .keyboardType(.asciiCapable)
                    
    
                    
                    
                    Text ( "Vehicle Number".localize)
                        .font(.custom(( LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold : AppFont.Bold).rawValue , size: 14))
                        .padding(.top , 10 )
                    
                    OtpFormFieldView(pinOne: $pinOne, pinTwo: $pinTwo, pinThree: $pinThree, pinFour: $pinFour , numKeyboard: true   )
                    
                    
                }
                .frame( maxWidth: .infinity ,  alignment: .center)
                
                Divider()
                
                
   //MARK: -  car images section
                Text ( "4 Side of the vehicle".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(( LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold : AppFont.Bold).rawValue , size: 14))
                tab7DriverAuth(urls: $carUrls , isComeFromProfile: true  )
                Divider()
//MARK: -  more info. section
                Text ( "More Info".localize)
                    .foregroundStyle(Color( "MainColor"))
                    .font(.custom(( LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold : AppFont.Bold).rawValue , size: 14))
                
               
                    
                    floatingPickerViews( selectedClass: $VehicleClass, selectedSeatNum: $seatsNumber, selectedColor: $VehicleColor , selectedType: $VehicleType , selectedName: $VehicleName, selectedYear: $year   , carDetails: $carDetails)
                      
                Button {
                   
                      
                       
                   
                } label: {
                    Text( "Add Vehicle".localize)
                        .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 20))
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
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("BackGroundColor" ))
        .onAppear(perform: {
               activityIndicatorr.startAnimating()
               AuthRouter.allCarDetails.send {  (response : APIGenericResponse<CarDetailsResult>) in
                   if let result = response.result {
                       
                       self.carDetails = result
                   }
               }
        })
        
    }
}

#Preview {
    addNewCarSwiftui()
}
