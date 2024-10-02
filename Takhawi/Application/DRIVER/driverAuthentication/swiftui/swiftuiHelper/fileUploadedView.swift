//
//  fileUploadedView.swift
//  Takhawi
//
//  Created by Reham Ayman on 02/02/2024.
//

import SwiftUI

struct fileUploadedView: View {
    
 @Binding var url : URL
 @Binding var AllUrls : [URL]
    
    
    var body: some View {
      
        VStack {
            
            HStack {
                Text (url.pathExtension)
                    .font(.custom( AppFont.Medium.rawValue , size: 13))
                    .foregroundStyle(Color( "MainColor"))
                    .frame(width: 45  , height: 45  , alignment: .center)
                    .background(Color ( "secFavSeg"))
                    .cornerRadius(22.5)
                VStack( alignment: .leading , spacing: 5 ){
                    Text( url.lastPathComponent)
                        .lineLimit(2)
                        .font(.custom( AppFont.Regular.rawValue , size: 13))
                    Text (  "\(self.sizePerMB(url: self.url)) MB")
                        .font(.custom( AppFont.Regular.rawValue , size: 12))
                        .foregroundStyle(Color.gray)
                }
                
                
                Spacer()
                
                Button(action: {
                        self.AllUrls = AllUrls.filter { $0 != url }
                   
                }, label: {
                   Image( "cross 1")
                })
                
            }
            
            
        }
        .padding( .horizontal )
        .frame(maxWidth: .infinity)
        .frame(height: 65)
        .background(Color ( "BackGroundColor"))
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.5),radius: 4 , x: 0  , y: 2)
        .padding( .horizontal , 25 )
       
        
     

        
        
    }
    
    
    private func sizePerMB(url: URL?) -> Double {
        url?.startAccessingSecurityScopedResource()
        guard let filePath = url?.path else {
            return 0.0
        }
        do {
            let attribute = try FileManager.default.attributesOfItem(atPath: filePath)
            if let size = attribute[FileAttributeKey.size] as? NSNumber {
                return size.doubleValue / 1000000.0
            }
        } catch {
            print("Error: \(error)")
        }
        
        url?.stopAccessingSecurityScopedResource()
        return 0.0
    }
    
    
}





struct CustomfileUploadedView: View {
    
 @State var url : URL
 //@Binding var AllUrls : [URL]
    
    
    var body: some View {
      
        VStack {
            
            HStack {
                Text (url.pathExtension)
                    .font(.custom( AppFont.Medium.rawValue , size: 13))
                    .foregroundStyle(Color( "MainColor"))
                    .frame(width: 45  , height: 45  , alignment: .center)
                    .background(Color ( "secFavSeg"))
                    .cornerRadius(22.5)
                VStack( alignment: .leading , spacing: 5 ){
                    Text( url.lastPathComponent)
                        .lineLimit(2)
                        .font(.custom( AppFont.Regular.rawValue , size: 13))
                    Text ( "12 MB")
                        .font(.custom( AppFont.Regular.rawValue , size: 12))
                        .foregroundStyle(Color.gray)
                }
                
                
                Spacer()
                
                Button(action: {
                 
                      //  self.AllUrls = AllUrls.filter { $0 != url }
                   
                   
                   
                }, label: {
                   Image( "cross 1")
                })
                
            }
            
            
        }
        .padding( .horizontal )
        .frame(maxWidth: .infinity)
        .frame(height: 65)
        .background(Color ( "BackGroundColor"))
        .cornerRadius(8)
        .shadow(color: .gray.opacity(0.5),radius: 4 , x: 0  , y: 2)
        .padding( .horizontal , 25 )
       
        
        
        
        
    }
}



