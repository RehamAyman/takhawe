//
//  otpModifier.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/02/2024.
//

import SwiftUI
import Combine


struct OtpFormFieldView: View {
    //MARK -> PROPERTIES

    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour
    }

    @FocusState private var pinFocusState : FocusPin?
    @Binding var pinOne: String
    @Binding var pinTwo: String
    @Binding var pinThree: String
    @Binding var pinFour: String
    @State var numKeyboard : Bool = false
    @State var threeItems : Bool = false


    //MARK -> BODY
    var body: some View {
            VStack {

                HStack(spacing:15, content: {

                    TextField("", text: $pinOne)
                        .modifier(OtpModifer(pin:$pinOne, numKeyboard: $numKeyboard))
                        .onChange(of:pinOne){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinTwo
                            }
                        }
                        .focused($pinFocusState, equals: .pinOne)

                    TextField("", text:  $pinTwo)
                        .modifier(OtpModifer(pin:$pinTwo, numKeyboard:  $numKeyboard))
                        .onChange(of:pinTwo){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinThree
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinOne
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinTwo)


                    TextField("", text:$pinThree)
                        .modifier(OtpModifer(pin:$pinThree, numKeyboard:  $numKeyboard))
                        .onChange(of:pinThree){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinFour
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinTwo
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinThree)

                    if threeItems == false  {
                        TextField("", text:$pinFour)
                            .modifier(OtpModifer(pin:$pinFour, numKeyboard:  $numKeyboard))
                            .onChange(of:pinFour){newVal in
                                if (newVal.count == 0) {
                                    pinFocusState = .pinThree
                                }
                            }
                            .focused($pinFocusState, equals: .pinFour)
                    }
                   


                })
                .padding(.vertical)

            }

    }
}


struct OtpModifer: ViewModifier {

    @Binding var pin : String
    @Binding var numKeyboard : Bool

    var textLimt = 1

    func limitText(_ upper : Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }


    //MARK -> BODY
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType( numKeyboard ? .numberPad : .default )
            .onReceive(Just(pin)) {_ in limitText(textLimt)}
            .frame(width: 45, height: 45)
            .cornerRadius(8)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("MainColor"), lineWidth: 2)
            )
    }
}
