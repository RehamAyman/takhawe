//
//  driverAuth+extention.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/07/2024.
//

import SwiftUI

extension driverAuthView {
    func Validation (newTab : Int) {
        
    }
    
    
    func goToNextAction () {
        
        switch self.tabSelection {
        case 1 :
            self.uploadNationalId()
        case 2:
            self.uploadDrivingLicense()
        case 3:
            self.uploadCarLicense()
        case 4 :
            self.uploadAvatarImage()
        case 5 :
            self.upload4CarImages()
        case 6 :
            self.uploadCarInsuranceImage()
        case 7:
            self.uploadSerialNum()
        case 8:
            self.uploadCarNum()
        case 9:
            self.FinalStep()
            
        default:
            print("..")
        }
     
    }
   
    
  //MARK: - NATIONAL ID STEP ONE
    private func uploadNationalId () {
       
        var uploadedData = [UploadData]()
        if self.nationalIdText.count != 10  {
            showPopTopAlert(title: "Invalid national id".localize, withMessage:  "please enter a valid national id 10digts".localize , success: false )
        } else if self.nationalIdsImages.count != 2 {
            showPopTopAlert(title: "sorry", withMessage: "you should upload 2 fiels in this step", success: false )
        } else {
      
            guard let data1 =  self.changeUrlsToUpload(url: self.nationalIdsImages[0], key: "Front National ID") else { return }
            guard let data2 =  self.changeUrlsToUpload(url: self.nationalIdsImages[1], key: "Back National ID") else { return }
            uploadedData.append(data1)
            uploadedData.append(data2)
            print(uploadedData)
            activityIndicatorr.startAnimating()
            AuthRouter.driverUploadNationalId(nationalId: self.nationalIdText).send(data: uploadedData) {  ( response : APIGlobalResponse )  in
                if response.status == true {
                   
                        self.tabSelection =  2
                    
                }
            }
            
            self.nationalIdsImages[0].stopAccessingSecurityScopedResource()
            self.nationalIdsImages[1].stopAccessingSecurityScopedResource()
 
        }
    }
    
//MARK: - DRIVING LICENSE  STEP  TWO
    
    private func uploadDrivingLicense () {
        if self.drivingLicenseUrls.count != 2 {
            showPopTopAlert(title: "sorry", withMessage: "you should upload 2 fiels in this step", success: false )
        } else {
            var uploadedData = [UploadData]()
            guard let data1 =  self.changeUrlsToUpload(url: self.drivingLicenseUrls[0], key: "Front Driving Licence") else { return }
            guard let data2 =  self.changeUrlsToUpload(url: self.drivingLicenseUrls[1], key: "Back Driving Licence") else { return }
            uploadedData.append(data1)
            uploadedData.append(data2)
            activityIndicatorr.startAnimating()
            AuthRouter.driverUploadDrivingLicens.send(data: uploadedData) {  ( response : APIGlobalResponse )  in
                if response.status == true {
                  
                        self.tabSelection =  3
                   
                }
            }
            
            self.drivingLicenseUrls[0].stopAccessingSecurityScopedResource()
            self.drivingLicenseUrls[1].stopAccessingSecurityScopedResource()
            
        }
    }
    
//MARK: - CAR LICENSE  STEP  THREE
    
    private func uploadCarLicense () {
        if self.carLicensUrl.count != 2 {
            showPopTopAlert(title: "sorry", withMessage: "you should upload 2 fiels in this step", success: false )
        } else {
            var uploadedData = [UploadData]()
            guard let data1 =  self.changeUrlsToUpload(url: self.carLicensUrl[0], key: "file_path") else { return }
            guard let data2 =  self.changeUrlsToUpload(url: self.carLicensUrl[1], key: "file_path") else { return }
            uploadedData.append(data1)
            uploadedData.append(data2)
            activityIndicatorr.startAnimating()
            AuthRouter.uploadCarLicense.send(data: uploadedData) {  ( response : APIGlobalResponse )  in
                if response.status == true {
                    
                        self.tabSelection =  4
                  
                }
            }
            self.carLicensUrl[0].stopAccessingSecurityScopedResource()
            self.carLicensUrl[1].stopAccessingSecurityScopedResource()
        }
    }
    
//MARK: - DRIVER AVATAR IMAGE  STEP FOUR
    private func uploadAvatarImage () {
        
        var uploadedData = [UploadData]()
        if let image =   self.profileImage {
            activityIndicatorr.startAnimating()
            let imageData = image.jpegData(compressionQuality: 0.4)!
            uploadedData.append(UploadData(data: imageData , fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: .jpg, name: "avatar"))
            AuthRouter.driverImage.send(data: uploadedData) { ( response : APIGlobalResponse )  in
                if response.status == true {
                   
                        self.tabSelection = 5
                    
                }
            }
            
            
        } else {
            showInfoTopAlert(withMessage: "select image first!")
        }
        
    }
    
//MARK: - UPLOAD 4 SIDE CAR IMAGES  STEP FIVE
    
    private func upload4CarImages () {
        if self.carImages.count !=  4 {
            showInfoTopAlert(withMessage: "Please Upload 4 side photos of your vehicles".localize)
        } else {
            activityIndicatorr.startAnimating()
            var uploadedData = [UploadData]()
            for i in self.carImages {
                if let imageData = self.changeUrlsToUpload(url: i , key: "file_path") {
                    uploadedData.append(imageData)
                }
            }
            
            AuthRouter.uploadCarImages.send(data: uploadedData) {  ( response : APIGlobalResponse )  in
                if response.status == true {
                    self.tabSelection = 6
                }
            }
            
        }
        
    }
    
//MARK: - CAR  INSURANCE IMAGE STEP 6
    
    private func uploadCarInsuranceImage () {
        if self.carInsuranceimage.count != 1 {
            showInfoTopAlert(withMessage: "Please upload 1 file of your car insurance photo".localized)
        } else {
            
            activityIndicatorr.startAnimating()
            var uploadedData = [UploadData]()
            if let imageData = self.changeUrlsToUpload(url: self.carInsuranceimage.first! , key: "file_path") {
                uploadedData.append(imageData)
            }
            AuthRouter.uploadCarInsurance.send(data: uploadedData) { ( response : APIGlobalResponse )  in
                if response.status == true {
                    self.tabSelection = 7
                }
            }
        }
    }
    
    
//MARK: - SERIAL NUMBER  STEP 7
    
    
  private func uploadSerialNum () {
      if self.serialNumber == "" {
          showInfoTopAlert(withMessage: "please add your vehicle serial Number first".localize)
      }else {
          withAnimation {
              self.tabSelection = 8
          }
         
      }
        
    }
    
    //MARK: - car num and alpha STEP 8
    
    
    private func uploadCarNum () {
       
        if self.n1 == "" && self.n2 == "" &&  self.n3 == "" && self.n4 == ""  || (self.A1 == "" &&  self.A2 == "" && self.A3 == "" )   {
            showInfoTopAlert(withMessage: "please enter your plate num first! ".localize)
        } else {
            
            withAnimation {
                self.tabSelection = 9
            }
        }
    }
    
    //MARK: - create a vehicle  STEP 9
    
    
    private func  FinalStep () {
       
        let plateNum = self.n1 + self.n2 + self.n3 + self.n4
        let plateAlpha = self.A1 + self.A2 + self.A3
        
        activityIndicatorr.startAnimating()
        DriverRouter.createAvehicle(serialNum: self.serialNumber , plateAlphabet: plateAlpha, plateNum: plateNum, year: self.year, seats: self.seatsNumber, class: self.VehicleClass, color: self.VehicleColor, type: self.VehicleType, name: self.VehicleName).send {( response : APIGenericResponse<VehicleResult> )in
            
            if response.status == true {
                self.action?()
            }
        }
       
    }
    
    
    
     func getCarDetails () {
        activityIndicatorr.startAnimating()
        
        AuthRouter.allCarDetails.send {  (response : APIGenericResponse<CarDetailsResult>) in
           
            if let result = response.result {
                self.carDetails = result
                
               
            }
           
        }
    }
    
//MARK: - PREP TP  UPLOAD FIELS TO THE SERVER
    
    
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
    
    
    
    private func getAllData () {
        
    }

    
}
