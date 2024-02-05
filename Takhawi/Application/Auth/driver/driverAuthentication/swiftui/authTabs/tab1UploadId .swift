//
//  tab1UploadId .swift
//  Takhawi
//
//  Created by Reham Ayman on 26/01/2024.
//

import SwiftUI

import MediaPicker

struct tab1UploadIdView : View {
    @State var IDNumber : String = ""
    @State private var showingConfirmation = false
    @State var isShowingMediaPicker = false
    @State var urls: [URL] = []
    @State var showDocsPicker : Bool = false
  //  @State private var CameraImage: UIImage?
  //  @State  var AllImages : [UIImage] = []
  //  @State private var showCamera = false
 
    
    
    
//MARK: - VARS
  
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    
    var body: some View {
        ScrollView {
            VStack ( alignment: .leading ) {
            Text("Congratulations for taking the first step in becoming a driver on the Takhawy platform.")
            Text ( "Please Upload your front and back photo of your National ID, Make sure all information is readable, not blurry and that all corners of the document are visible. If you are uploading a PDF, insert all pages together in one file.")}
                .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
                .padding(10)
                .foregroundColor(Color.black.opacity(0.6))
            
            
            
            
            VStack {
               Image( "Vector 8")
                    .resizable()
                    .frame(width: 70 , height:  50 )
                Text ( "Please Upload Your ID ")
                    .font(.custom(  (IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
                    .padding(5)
                Button(action: { self.showingConfirmation.toggle() }, label: {
                    Text("Upload")
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
            
            
      
            
            
           FloatingTextField(title: "Enter Your ID Number" , text:  $IDNumber )
                .padding(.horizontal , 10)
            Spacer()
        }
        
        
        
        
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Using your Photos") { isShowingMediaPicker.toggle() }
            Button("Using your Files") { showDocsPicker.toggle() }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Choose a method")
        }
        
        
//MARK: - MEDIA PICKER
        
        .mediaImporter(isPresented: $isShowingMediaPicker,
                        allowedMediaTypes: .images,
                       allowsMultipleSelection: true) { result in
            switch result {
            case .success(let urls):
                
                for i in urls {
                    self.urls.append(i)
                    print("--------")
                    print(i)
                }
            case .failure(let error):
                print(error)
               // self.urls = []
            }
        }
   .fileImporter(isPresented: $showDocsPicker ,
                 allowedContentTypes: [.pdf , .png , .jpeg , .plainText , .text , .image ,.svg ,.plainText] ,
    allowsMultipleSelection: true)
                               { result in
                                   switch result {
                                   case .success(let url):
                                       print(url)
                                       //use `url.startAccessingSecurityScopedResource()` if you are going to read the data
                                       for i in url {
                                           self.urls.append(i)
                                       }
                                   case .failure(let error):
                                       print(error)
                                       // processing results Result<[URL], Error>
                                   }
                               }
        
        
//MARK: - CAMERA PICKER
        
//   .fullScreenCover(isPresented: $showCamera) {
//    CameraPickerView() { cameraModel  in
//        self.CameraImage = cameraModel.image
//        self.urls.append(cameraModel.url)
//        } }
        
    }
}

#Preview {
    driverAuthView()
  //  tab1UploadIdView()
}



