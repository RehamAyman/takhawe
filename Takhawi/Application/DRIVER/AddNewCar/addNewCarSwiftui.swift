//
//  addNewCarSwiftui.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//
// loc check
import SwiftUI

struct addNewCarSwiftui: View {
  
    @State var carInsuranceUrl : [URL] = []
   // @State var DrivingLicensUrls : [URL] = []
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
    var action: (() -> Void)?
    
    
    
    
    var body: some View {
        ScrollViewReader { proxy in
            
            ScrollView(showsIndicators: false ) {
                VStack(alignment: .leading ) {
                    
                    //MARK: -  driver id section
                    Text("Car Insurance".localize)
                        .foregroundStyle(Color( "MainColor"))
                        .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                        .padding(.bottom , 5)
                    carInsuranceView(urls: $carInsuranceUrl , isComeFromSettings: true  )
                    //                uploadingSection( urls: $carInsuranceUrl, titleText: .constant( "Please upload your car insurance photo".localize))
                    
                    Divider()
                    
                    //MARK: -  driver license section
                    
                    //                Text("Driving License".localize)
                    //                    .foregroundStyle(Color( "MainColor"))
                    //                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arMedium : AppFont.Medium).rawValue , size: 13))
                    //                    .padding(.bottom , 5)
                    //                uploadingSection( urls: $DrivingLicensUrls, titleText: .constant("Please Upload Your Driving License".localize))
                    //
                    //                Divider()
                    //
                    
                    //MARK: -  Vehicle license section
                    
                    
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
                    
                    FloatingSecTextField( numKeyboard: false , title: "vehicle serial Number".localize , text:  $serialNum  )
                  //  FloatingTextField(numKeyboard: false , title: "vehicle serial Number".localize , text:  $serialNum    )
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
                        
                            .environment(\.layoutDirection, .leftToRight  )
                        
                        
                        Text ( "Vehicle Number".localize)
                            .font(.custom(( LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold : AppFont.Bold).rawValue , size: 14))
                            .padding(.top , 10 )
                        
                        OtpFormFieldView(pinOne: $pinOne, pinTwo: $pinTwo, pinThree: $pinThree, pinFour: $pinFour , numKeyboard: true   )
                            .environment(\.layoutDirection, .leftToRight  )
                        
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
                        .environment(\.layoutDirection, .leftToRight  )
                    
                    Button {
                        
                        self.checkValidationAndSubmit()
                        
                        
                    } label: {
                        Text( "Add Vehicle".localize)
                            .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 18))
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
    
    func checkValidationAndSubmit () {
        print("check ")
        if self.carInsuranceUrl.count == 0  {
            showInfoTopAlert(withMessage: "Please upload 1 file of your car insurance photo".localize)
        } else if self.carRegisterationUrls.count  < 2 {
            showInfoTopAlert(withMessage: "you must apload  2 files to your car license")
        }else if carUrls.count < 4 {
            showInfoTopAlert(withMessage: "Please Upload 4 side photos of your vehicles ".localize)
        }
        else if self.serialNum == "" {
            showInfoTopAlert(withMessage: "Empty Field".localize)
        }else {
            self.addNewCar()
        }
    }
    
    
   private func addNewCar () {
       activityIndicatorr.startAnimating()
       let plateNum = self.pinOne + self.pinTwo + self.pinThree  + self.pinFour
       let plateAlpha = self.AOne + self.ATwo + self.AThree
       let plateAr = convertToArabic(text: AOne ) +  convertToArabic(text: ATwo  ) + convertToArabic(text: AThree)
       
       var uploadImage : [UploadData] = []
       
       
       // car images ٤ صور ل السياره
       for i in self.carUrls {
           if let imageData = self.changeUrlsToUpload(url: i , key: "Vehicle Image") {
               uploadImage.append(imageData)
           }
       }
       
       // car license رخصه المركبه

       for i in self.carRegisterationUrls {
           if let imageData = self.changeUrlsToUpload(url: i , key: "Licence Image") {
               uploadImage.append(imageData)
           }
       }
       
       
       // insurance image
       if let url = self.carInsuranceUrl.first {
           if  let image =  self.changeUrlsToUpload(url:  url  , key: "Insurance Image") {
               uploadImage.append(image)
           }
       }
       
       

       DriverRouter.addNewCar(serialNo: self.serialNum , plateAlpha: plateAlpha  , plateNo: plateNum , plateAlphaAr: plateAr , year: self.year , seatNo: self.seatsNumber , classId: self.VehicleClass , colorId: self.VehicleColor , typeId: self.VehicleType , nameId: self.VehicleName ).send(data: uploadImage ) {  ( response : APIGlobalResponse )  in
           if response.status == true {
               showPopTopAlert(title: "success", withMessage: response.message , success: true )
               self.action?()
           }
         
       }
    }
    
    
    private func changeUrlsToUpload (url : URL , key : String) -> UploadData? {
       url.startAccessingSecurityScopedResource()
       do {
          
           let fdata = try Data(contentsOf: url ,options: .alwaysMapped )
           let ImgName : String =  url.lastPathComponent
           let IMGtype : mimeType = url.pathExtension == "pdf" ? .pdf : .jpg
           let uploadD = UploadData(data: fdata , fileName:  ImgName , mimeType:  IMGtype , name: key)
           
           return uploadD
       } catch {
           print("❌❌❌❌❌❌❌\(error)")
           
           return nil
       }
       
    }
    
    
}

#Preview {
    addNewCarSwiftui()
}
