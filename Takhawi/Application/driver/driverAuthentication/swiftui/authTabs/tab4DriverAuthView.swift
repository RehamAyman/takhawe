//
//  tab4DriverAuthView.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/02/2024.
//

import SwiftUI

struct tab4DriverAuthView: View {
    
   
    @State var isShowingMediaPicker : Bool = false
    @State var imageUrl : URL?
    @State var profileImage : UIImage?
    
    
    var body: some View {
        
        VStack {
            VStack ( alignment: .leading , spacing: 3) {
                Text ( "Your profile photo helps people recognize you. Please note that once you submit your profile photo it cannot be changed.")
                Text ( "1. Face the camera directly with your eyes and mouth clearly visible")
                Text ( "2. Make sure the photo is well lit, free of glare, and in focus")
                Text ( "3. No photos of a photo, filters, or alterations")
                
            }
            .font(.custom( AppFont.Regular.rawValue , size: 12))
            .padding(10)
            .foregroundColor(Color.black.opacity(0.6))
            
            Text ( "Profile Picture")
                .font(.custom( AppFont.Bold.rawValue , size: 20))
                .foregroundStyle(Color( "MainColor"))
            
            if self.profileImage == nil {
                Image ( "Group 1000002908")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110 , height: 110 , alignment: .center)
                    .cornerRadius(55)
                    .clipped()
                
                   
                    .onTapGesture {
                        self.isShowingMediaPicker.toggle()
                    }
            } else {
                Image(uiImage: self.profileImage!)
                    .resizable()
                    .frame(width: 110 , height: 110 , alignment: .center)
                    .cornerRadius(55)
                    .shadow(radius: 10)
                    .onTapGesture {
                        self.isShowingMediaPicker.toggle()
                    }
                
            }
            
            Spacer()
        }
        
        .mediaImporter(isPresented: $isShowingMediaPicker,
                        allowedMediaTypes: .images,
                       allowsMultipleSelection: false ) { result in
            switch result {
            case .success(let urls):
                self.imageUrl = urls.first
                self.profileImage = UIImage(contentsOfFile: urls.first?.path ?? "" )
                   
                     
            case .failure(let error):
                print(error)
               // self.urls = []
            }
        }
    }
    
    
   
    
    
    
}

#Preview {
    tab4DriverAuthView()
}
