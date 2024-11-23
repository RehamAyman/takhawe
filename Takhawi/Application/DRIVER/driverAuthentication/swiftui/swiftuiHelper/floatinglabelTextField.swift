//
//  floatinglabelTextField.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/01/2024.
//




import SwiftUI


enum Field: Int, Hashable {
   case focused, unFocused
}






struct FloatingTextField: View {
    var numKeyboard : Bool = false
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    @State var textColor : Color = .gray
   
   
    
    let title: String
    
    @Binding var text: String
    
//    @State var isFocused: Bool = false
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
//    @FocusState  var focusField: Field?
    @FocusState private var isKeyBoardActive: Bool 
    
    
    
    var body: some View {
        ZStack(alignment: .leading) {
          
                TextField("", text: $text)
                    .focused($isKeyBoardActive)
                    .frame(height: 50, alignment: .leading)
                    .padding(.horizontal, 16)
                    .keyboardType( numKeyboard ? .asciiCapableNumberPad : .default )
                    .autocorrectionDisabled(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(
                        RoundedRectangle(cornerRadius: 25 )
                            .strokeBorder(Color ( "MainColor"), lineWidth: 2)
                    )
                    .toolbar {
                      
                        ToolbarItem(placement: .keyboard ) {
                          
                                HStack {
                                    Spacer()
                                    Button {
                                        
                                        print("done button pressed ")
                                        isKeyBoardActive = false
                                    } label: {
                                        Text ("done" )
                                            .foregroundStyle(Color( "MainColor"))
                                    }
                                }
                        }
                    }
            

            
            Text(text.isEmpty ? title : title.withSingleLeadingSpace.withSingleTrailingSpace)
                .font(.custom(  (IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 14))
                .foregroundColor( text.isEmpty ? Color.gray : Color( "MainColor") )
            /// Do not replace `Color.white.opacity(0)` with `Color.clear`, it will result in unexpected behavior on changing animation state
                .background(text.isEmpty ? Color.white.opacity(0) : Color ( "BackGroundColor" ))
                .offset(y: text.isEmpty ? 0 : -33)
                .scaleEffect(text.isEmpty ? 1 : 0.75, anchor: .leading)
                .animation(.spring(response: 0.5, dampingFraction: 0.6))
                .padding(.horizontal, 16)
                .onTapGesture {
                   
                        isKeyBoardActive = true

                }
        }
        .padding(15)
        .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
        
    }
}

#if DEBUG
struct FloatingTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTextField(title: "Your Email Address", text: .constant(""))
//            .frame(width: 350, height: 60, alignment: .center)
    }
}
#endif






extension String {
    
    var withSingleTrailingSpace:  String {
        appending(" ")
    }
    
    var withSingleLeadingSpace:  String {
        " " + self
    }
}



struct FloatingSecTextField: View {
    var numKeyboard : Bool = false
    var IsArabicLang : Bool {
        if LocalizationManager.shared.getLanguage() == .Arabic {
            return true
        } else {
            return false
        }
    }
    
    @State var textColor : Color = .gray
   
   
    
    let title: String
    
    @Binding var text: String
    
    
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)

    @FocusState  var isKeyBoardActive: Bool
    
    
    
    var body: some View {
        ZStack(alignment: .leading) {
          
                TextField("", text: $text)
                    .focused($isKeyBoardActive)
                    .frame(height: 50, alignment: .leading)
                    .padding(.horizontal, 16)
                    .keyboardType( numKeyboard ? .asciiCapableNumberPad : .default )
                    .autocorrectionDisabled(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(
                        RoundedRectangle(cornerRadius: 25 )
                            .strokeBorder(Color ( "MainColor"), lineWidth: 2)
                    )
                   
            

            
            Text(text.isEmpty ? title : title.withSingleLeadingSpace.withSingleTrailingSpace)
                .font(.custom(  (IsArabicLang ? AppFont.arRegular : AppFont.Regular).rawValue , size: 14))
                .foregroundColor( text.isEmpty ? Color.gray : Color( "MainColor") )
            /// Do not replace `Color.white.opacity(0)` with `Color.clear`, it will result in unexpected behavior on changing animation state
                .background(text.isEmpty ? Color.white.opacity(0) : Color ( "BackGroundColor" ))
                .offset(y: text.isEmpty ? 0 : -33)
                .scaleEffect(text.isEmpty ? 1 : 0.75, anchor: .leading)
                .animation(.spring(response: 0.5, dampingFraction: 0.6))
                .padding(.horizontal, 16)
                .onTapGesture {
                        isKeyBoardActive = true
                }
        }
        .padding(15)
        .environment(\.layoutDirection,  IsArabicLang ? .rightToLeft :  .leftToRight  )
        
    }
}


