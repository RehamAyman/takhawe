//
//  tab7DriverAuth.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/02/2024.
//

import SwiftUI

struct tab7DriverAuth: View {
    @State var isShowingMediaPicker : Bool = false
    @Binding var urls : [URL] 
    @State private var showAlert = false
    
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            VStack ( alignment: .leading , spacing: 3) {
                Text ( "1. Access the designated section and click on the upload button.".localize)
                Text ( "2. Take clear pictures of the car's front, back, left side, and right side.".localize)
                Text ( "3.  Select the image files and upload them using the provided prompt.".localize)
                Text ( "4. Review the uploaded images and save or submit to complete the process.".localize)
                
            }
            .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 12))
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
            
            VStack {
                Image( "car 1")
                    .resizable()
                    .frame(width: 80 , height:  80 )
                Text ( "Please Upload 4 side photos of your vehicles ".localize)
                    .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 12))
                  
                    .padding(5)
                Button(action: {
                    if self.urls.count == 4 {
                        showInfoTopAlert(withMessage: "you cant upload more than 4 images ".localize)
                    } else {
                        isShowingMediaPicker.toggle()
                    }
                    }, label: {
                    Text("Upload".localize)
                        .foregroundStyle(Color.white)
                        .font(.custom((IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 13))
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
            
            
            // images list here
            
            
          
            
            
            VStack {
                
                
                if let firstImage = self.urls.first {
                    
                    ZStack (alignment: .topTrailing ) {
                        
                        let image =   UIImage(contentsOfFile: firstImage.path)
                        Image(uiImage: image ?? UIImage()  )
                            .resizable()
                            .frame(height: 150 )
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                        
                        Button(action: {  urls.remove(at: 0)}, label: {
                          
                            Image ( "Group 26")
                                .resizable()
                                .frame(width: 40 , height: 40)
                                .padding(8)
                        })
                    }
                }
                
                
                HStack (  spacing: 20 ) {
                    ForEach(Array(urls.enumerated()), id: \.element) { index, element in
                        if let image =   UIImage(contentsOfFile: element.path)  {
                            if index == 1  || index == 2 {
                                ZStack (alignment: .topTrailing ) {
                                    
                                    Image(uiImage: image  )
                                        .resizable()
                                        .frame(height: 130 )
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                    
                                    
                                    
                                    
                                    Button(action: {  urls.remove(at:index == 1 ?  1 : 2)}, label: {
                                      
                                        Image ( "Group 26")
                                            .resizable()
                                            .frame(width: 40 , height: 40)
                                            .padding(8)
                                    })
                                    
                                }
                            }
                            
                        }
                        
                    }
                }.padding( .vertical , 10)
                
                
                if self.urls.count == 4 {
                    if let lastImage = self.urls.last {
                        let image =   UIImage(contentsOfFile: lastImage.path)
                        
                        ZStack (alignment: .topTrailing ) {
                            
                            Image(uiImage: image ?? UIImage()  )
                                .resizable()
                            
                                .frame(height: 150 )
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .shadow(radius: 10)
                                .cornerRadius(10)
                            
                            Button(action: {  urls.remove(at: 3)}, label: {
                              
                                Image ( "Group 26")
                                    .resizable()
                                    .frame(width: 40 , height: 40)
                                    .padding(8)
                            })
                            
                        }
                    }
                    
                }
            }
            .padding()
              
                  
                
                
                
                
                
                
           
        }
        .alert("Error!".localize, isPresented: $showAlert) {
            Button("OK".localize, role: .cancel) { }
                  } message: {
                      Text("you cant upload more than 4 images ".localize)
                  }
        
        .mediaImporter(isPresented: $isShowingMediaPicker,
                        allowedMediaTypes: .images,
                       allowsMultipleSelection: true ) { result in
            switch result {
            case .success(let urls):
                
                if urls.count == 4 {
                    self.urls =  Array(urls.prefix(4))
                } else  if (self.urls + urls ).count > 4 {
                    showAlert = true
//                    showInfoTopAlert(withMessage: "you cant upload more than 4 images ".localize)
                } else {
                    for i in urls {
                        self.urls.append(i)
                    }
                }
                  //  self.urls =  Array(urls.prefix(4))
               
              
       
            case .failure(let error):
                print(error)
               // self.urls = []
            }
        }
        
        
        
    }
}


