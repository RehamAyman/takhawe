//
//  secureTextField.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI



struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arRegular.rawValue :  AppFont.Regular.rawValue , size: 13))
                        .onReceive(text.publisher.collect()) {
                                text = String($0.prefix(5))
                        }
                        
                } else {
                    TextField(title, text: $text)
                        .font(.custom( LocalizationManager.shared.getLanguage() == .Arabic ?  AppFont.arRegular.rawValue :  AppFont.Regular.rawValue , size: 13))
                        .onReceive(text.publisher.collect()) {
                                text = String($0.prefix(5))
                        }
                    
                       
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(Color( "MainColor"))
            }
        }  .font(.custom(AppFont.Regular.rawValue, size: 14))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                       .stroke(Color("MainColor"), lineWidth: 2)
                       .frame(height: 50 )
            )
           
    }
}
