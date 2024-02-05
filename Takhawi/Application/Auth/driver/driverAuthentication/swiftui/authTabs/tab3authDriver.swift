//
//  tab3authDriver.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/02/2024.
//

import SwiftUI

struct tab3authDriver: View {
    @State var showingConfirmation = false
    @State var isShowingMediaPicker = false
    @State var showDocsPicker = false
    @State var urls: [URL] = []
    
    
    
    var body: some View {
        ScrollView {
            VStack ( alignment: .leading ) {
         
            Text ( "Make sure all information is readable, not blurry and that all corners of the document are visible. If you are uploading a PDF, insert all pages together in one file.")}
                .font(.custom( AppFont.Regular.rawValue , size: 13))
                .padding(10)
                .foregroundColor(Color.black.opacity(0.6))
            
            
            
            
            VStack {
               Image( "Layer 3")
                    .resizable()
                    .frame(width: 70 , height:  60 )
                Text ( "Please Upload Your Vehicle Registration")
                    .font(.custom(AppFont.Regular.rawValue , size: 13))
                    .padding(5)
                Button(action: { self.showingConfirmation.toggle() }, label: {
                    Text("Upload")
                        .foregroundStyle(Color.white)
                        .font(.custom(   AppFont.Bold.rawValue , size: 13))
                        .frame(width: 125 , height: 40)
                        .background(Color( "MainColor"))
                        .cornerRadius(20)
                })
                 
                
                
            }.frame(height: 190)
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
        
    }
}

#Preview {
    tab3authDriver()
}
