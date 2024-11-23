//
//  verifiyIdSwiftUIView.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/05/1446 AH.
//

import SwiftUI

struct verifiyIdSwiftUIView: View {
    
    @State var IDNumber : String = ""
    @State private var showingConfirmation = false
    @State var isShowingMediaPicker = false
    @State var urls: [URL] = []
    @State var showDocsPicker : Bool = false
    var action: (() -> Void)?
    
    
      var IsArabicLang : Bool {
          if LocalizationManager.shared.getLanguage() == .Arabic {
              return true
          } else {
              return false
          }
      }
    
    
    
    var body: some View {
      
        ScrollView(showsIndicators: false ) {
            VStack(alignment: .leading ) {
                VStack {
                   Image( "Vector 8")
                        .resizable()
                        .frame(width: 70 , height:  50 )
                    Text ( "Please Upload Your ID ".localize)
                        .font(.custom(  (IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
                        .padding(5)
                    Button(action: { // self.showingConfirmation.toggle()
                        if self.urls.count < 2 {
                       // isShowingMediaPicker.toggle()
                            showingConfirmation.toggle()
                    } else {
                        showInfoTopAlert(withMessage: "You cant upload more than 2 fiels".localize)
                    }
                        
                    }, label: {
                        Text("Upload".localize)
                            .foregroundStyle(Color.white)
                            .font(.custom(  (IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 13))
                            .frame(width: 125 , height: 40)
                            .background(Color( "MainColor"))
                            .cornerRadius(20)
                    })
                     
                }.frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color( "MainColor"), lineWidth: 2.5)
                    )
                    .padding(.horizontal , 25 )
                    .padding(.bottom , 5 )
                
              
                    ForEach ( $urls , id: \.self) {   url  in
                        fileUploadedView(url: url, AllUrls: $urls)
                    }
           
                FloatingTextField(numKeyboard: true, title: "Enter Your ID Number".localize , text:  $IDNumber   )
                   .padding(.horizontal , 10)
                
                
                
                Button {
                   
                    self.validateAndConfirm()
                       
                   
                } label: {
                    Text( "Send".localize )
                        .font(.custom(IsArabicLang ? AppFont.arBold.rawValue : AppFont.Bold.rawValue , size: 17 ))
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
        .confirmationDialog("Choose a method", isPresented: $showingConfirmation ) {
            Button("Using your Photos".localize) {
                if self.urls.count < 2 {
                isShowingMediaPicker.toggle()
            } else {
                showInfoTopAlert(withMessage: "You cant upload more than 2 fiels".localize)
            }
            }
            Button("Using your Files".localize) {
                if self.urls.count < 2 {
                    showDocsPicker.toggle()
                } else {
                    showInfoTopAlert(withMessage: "You cant upload more than 2 fiels".localize) }
                }
            Button("Cancel".localize, role: .cancel) { }
        } message: {
            Text("Choose a method".localize)
        }
        
        
//MARK: - MEDIA PICKER
        
        .mediaImporter(isPresented: $isShowingMediaPicker,
                        allowedMediaTypes: .images,
                       allowsMultipleSelection: false  ) { result in
            switch result {
            case .success(let urls):
                
                for i in urls {
                    if self.urls.contains(i) {
                   
                    } else {
                        self.urls.append(i)
                    }
                   
                }
            case .failure(let error):
                print(error)
               // self.urls = []
            }
        }
   .fileImporter(isPresented: $showDocsPicker ,
                 allowedContentTypes: [.pdf ] ,
    allowsMultipleSelection: false )
                               { result in
                                   switch result {
                                   case .success(let url):
                                       print(url)
                                       //use `url.startAccessingSecurityScopedResource()` if you are going to read the data
                                      
                                       for i in url {
                                           if self.urls.contains(i) {
                                              
                                           } else {
                                               self.urls.append(i)
                                           }
                                       }
                                   case .failure(let error):
                                       print(error)
                                       // processing results Result<[URL], Error>
                                   }
                               }
        
        
    }
    
    private func validateAndConfirm () {
        var uploadedData = [UploadData]()
        if self.IDNumber.count != 10  {
            showPopTopAlert(title: "Invalid national id".localize, withMessage:  "please enter a valid national id 10digts".localize , success: false )
        } else if self.urls.count != 2 {
            showPopTopAlert(title: "sorry", withMessage: "you should upload 2 fiels in this step", success: false )
        } else {
      
            guard let data1 =  self.changeUrlsToUpload(url: self.urls[0], key: "Front National ID") else { return }
            guard let data2 =  self.changeUrlsToUpload(url: self.urls[1], key: "Back National ID") else { return }
            uploadedData.append(data1)
            uploadedData.append(data2)
            print(uploadedData)
            activityIndicatorr.startAnimating()
            AuthRouter.driverUploadNationalId(nationalId: self.IDNumber).send(data: uploadedData) {  ( response : APIGlobalResponse )  in
                if response.status == true {
                   
                    self.action?()
                    
                }
            }
            
            self.urls[0].stopAccessingSecurityScopedResource()
            self.urls[1].stopAccessingSecurityScopedResource()
 
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


