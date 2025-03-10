//
//  tab1UploadId .swift
//  Takhawi
//
//  Created by Reham Ayman on 26/01/2024.
//

import SwiftUI



struct tab1UploadIdView : View {
    @Binding var IDNumber : String 
    @State private var showingConfirmation = false
    @State var isShowingMediaPicker = false
    @Binding var urls: [URL]
    @State var showDocsPicker : Bool = false
  

   
    
    
//MARK: - VARS
  
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    
    var body: some View {
        VStack {
            VStack ( alignment: .leading ) {
                Text("Congratulations for taking the first step in becoming a driver on the Takhawy platform.".localize)
                Text ( "Please Upload your front and back photo of your National ID, Make sure all information is readable, not blurry and that all corners of the document are visible. If you are uploading a PDF, insert all pages together in one file.".localize)}
                .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
                .padding(10)
                .foregroundColor(Color.black.opacity(0.6))
                .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
            
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
                        
//MARK: - docs LIST
           
         
          
          
                ForEach ( $urls , id: \.self) {   url  in
                    fileUploadedView(url: url, AllUrls: $urls)
                }
                
       
            FloatingTextField(numKeyboard: true, title: "Enter Your ID Number".localize , text:  $IDNumber   )
               .padding(.horizontal , 10)
            
            Spacer(minLength: 180 )
               
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
        
        
//MARK: - CAMERA PICKER
        

    }
}




