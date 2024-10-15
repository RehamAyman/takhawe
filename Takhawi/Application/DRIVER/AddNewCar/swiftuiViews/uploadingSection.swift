//
//  uploadingSection.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//

import SwiftUI

struct uploadingSection: View {
   
    @State private var showingConfirmation = false
    @State var isShowingMediaPicker = false
    @Binding var urls: [URL]
    @State var showDocsPicker : Bool = false
    @Binding var titleText : String
    
    
    var body: some View {
        
        VStack {
           
               
            VStack {
               Image( "Vector 8")
                    .resizable()
                    .frame(width: 70 , height:  50 )
                Text ( titleText )
                    .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
                    .padding(5)
                Button(action: { // self.showingConfirmation.toggle()
                    if self.urls.count < 2 {
                   // isShowingMediaPicker.toggle()
                        showingConfirmation.toggle()
                } else {
                    showInfoTopAlert(withMessage: "You cant upload more than 2 fiels")
                }
                    
                }, label: {
                    Text("Upload")
                        .foregroundStyle(Color.white)
                        .font(.custom(  (LocalizationManager.shared.getLanguage() == .Arabic ? AppFont.arBold : AppFont.Bold).rawValue , size: 13))
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
                
       
            
          
               
        }
       
        
        .confirmationDialog("Choose a method", isPresented: $showingConfirmation ) {
            Button("Using your Photos") {
                if self.urls.count < 2 {
                isShowingMediaPicker.toggle()
            } else {
                showInfoTopAlert(withMessage: "You cant upload more than 2 fiels")
            }
            }
            Button("Using your Files") {
                if self.urls.count < 2 {
                    showDocsPicker.toggle()
                } else {
                    showInfoTopAlert(withMessage: "You cant upload more than 2 fiels") }
                }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Choose a method")
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
}

