//
//  swiftuiOTPview.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/02/2024.
//

import SwiftUI

@available(iOS 15.0, *)
public struct OtpView:View {
    
    private var activeIndicatorColor: Color
    private var inactiveIndicatorColor: Color
    private let doSomething: (String) -> Void
    private let length: Int
    private let numkeyboard: Bool
    
    
    @State private var otpText = ""
    @FocusState private var isKeyboardShowing: Bool
    
    public init(activeIndicatorColor:Color,inactiveIndicatorColor:Color, length:Int , numKeyboard : Bool , doSomething: @escaping (String) -> Void) {
        self.activeIndicatorColor = activeIndicatorColor
        self.inactiveIndicatorColor = inactiveIndicatorColor
        self.length = length
        self.numkeyboard = numKeyboard
        self.doSomething = doSomething
    }
    public var body: some View {
        HStack(spacing: 0){
            ForEach(0...length-1, id: \.self) { index in
                OTPTextBox(index)
            }
        }.background(content: {
            TextField("", text: $otpText.limit(4))
                .keyboardType( numkeyboard ? .numberPad : .default )
                .textContentType(numkeyboard ? .oneTimeCode : .username)
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
                .onChange(of: otpText) { newValue in
                    if newValue.count == length {
                        doSomething(newValue)
                    }
                }
//                .onAppear {
//                    DispatchQueue.main.async {
//                        isKeyboardShowing = true
//                    }
//                }
        })
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing = true
        }
    }
    
    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack{
            if otpText.count > index {
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? activeIndicatorColor : inactiveIndicatorColor)
                .animation(.easeInOut(duration: 0.2), value: status)

        }
        .padding()
    }
}

@available(iOS 13.0, *)
extension Binding where Value == String {
    func limit(_ length: Int)->Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}

@available(iOS 15.0, *)
struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OtpView(activeIndicatorColor: Color.black, inactiveIndicatorColor: Color.gray,  length: 4, numKeyboard: false , doSomething: { value in
            
        })
        .padding()
    }
}



