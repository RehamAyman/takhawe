//
//  carInsuranceView.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/08/2024.
//

import SwiftUI


struct carInsuranceView: View {
    @State var showingConfirmation = false
    @State var isShowingMediaPicker = false
    @State var showDocsPicker = false
    @Binding var urls: [URL]
    
    
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
                Text("An insurance policy that covers civil liability towards third parties".localize)
                Text ( "Policy validation: check the validity and validity of the insurance policy to ensure that it matches the vehicle data".localize)}
           
            .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
            
            
            VStack {
                Image( "driverLicense")
                    .resizable()
                    .frame(width: 85 , height:  55 )
                Text ( "Please upload your car insurance photo".localize)
                    .font(.custom((IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 13))
                    
                    .padding(5)
                Button(action: { // self.showingConfirmation.toggle()
                    if self.urls.count < 1 {
                   // isShowingMediaPicker.toggle()
                        self.showingConfirmation.toggle()
                } else {
                    showInfoTopAlert(withMessage: "You cant upload more than 1 fiels".localize)
                }
                }, label: {
                    Text("Upload".localize)
                        .foregroundStyle(Color.white)
                        .font(.custom((IsArabicLang ? AppFont.arBold : AppFont.Bold).rawValue , size: 13))
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
        
        .confirmationDialog("Change", isPresented: $showingConfirmation) {
            Button("Using your Photos".localize) {
                if self.urls.count < 1 {
                isShowingMediaPicker.toggle()
            } else {
                showInfoTopAlert(withMessage: "You cant upload more than 1 fiels".localize)
            }
            }
            Button("Using your Files".localize) {
                if self.urls.count < 1 {
                    showDocsPicker.toggle()
                } else {
                    showInfoTopAlert(withMessage: "You cant upload more than 1 fiels".localize) }
                }
               
            Button("Cancel".localize, role: .cancel) { }
        } message: {
            Text("Choose a method".localize)
        }
        
        //MARK: - MEDIA PICKER
                
        .mediaImporter(isPresented: $isShowingMediaPicker,
                                allowedMediaTypes: .images,
                               allowsMultipleSelection: false ) { result in
                    switch result {
                    case .success(let urls):
                        
                        for i in urls {
                            if self.urls.contains(i) {
                            } else {
                                withAnimation {
                                    self.urls.append(i)
                                }
                               
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
                                                       withAnimation {
                                                           self.urls.append(i)
                                                       }
                                                      
                                                   }
                                               }
                                           case .failure(let error):
                                               print(error)
                                               // processing results Result<[URL], Error>
                                           }
                                       }

    }
}

