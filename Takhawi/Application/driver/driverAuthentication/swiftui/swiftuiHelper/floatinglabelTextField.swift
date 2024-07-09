//
//  floatinglabelTextField.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/01/2024.
//




import SwiftUI



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
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    private enum Field: Int, Hashable {
        case focused, unFocused
    }
    
    let title: String
    
    @Binding var text: String
    
    @State var isFocused: Bool = false
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @FocusState private var focusField: Field?
  
    
    
    
    var body: some View {
        ZStack(alignment: .leading) {
           // if #available (iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
                TextField("", text: $text)
                    .focused($focusField, equals: .focused)
                    .frame(height: 50, alignment: .leading)
                    .padding(.horizontal, 16)
                    .keyboardType( numKeyboard ? .asciiCapableNumberPad : .default )
                    .autocorrectionDisabled(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(
                        RoundedRectangle(cornerRadius: 25 )
                            .strokeBorder(Color ( "MainColor"), lineWidth: 2)
                    )
            
//            } else {
//                LegacyTextField(isFirstResponderSender: $isFocused, text: $text)
//                    .frame(height: 50, alignment: .leading)
//                    .padding(.horizontal, 16)
//                    .textFieldStyle(PlainTextFieldStyle())
//                    .background(
//                        RoundedRectangle(cornerRadius: 25)
//                            .strokeBorder(Color( "MainColor"), lineWidth: 2)
//                    )
//            }
            
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
                   
                        focusField = .focused
                    
//                    if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
//                        focusField = .focused
//                    } else {
//                        isFocused = true
//                    }
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
            .frame(width: 350, height: 60, alignment: .center)
    }
}
#endif





public struct LegacyTextField: UIViewRepresentable {
    
    public enum FocusState: Int, Hashable {
        case focused, unFocused
    }
    
    public typealias ShouldReturnBlock = () -> Bool
    
    public typealias FocusChangedBlock = (Self.FocusState) -> Void
    
    public typealias TextFieldConfigurationBlock = (UITextField) -> Void
    
    @Binding public var isFirstResponderSender: Bool
    
    @Binding public var text: String
    
    public var shouldReturn: ShouldReturnBlock
    
    public var didFocused: FocusChangedBlock
    
    public var configuration: TextFieldConfigurationBlock
    
    public init(isFirstResponderSender: Binding<Bool>, text: Binding<String>, shouldReturn: @escaping LegacyTextField.ShouldReturnBlock = { true }, didFocused: @escaping LegacyTextField.FocusChangedBlock = { focused in }, configuration: @escaping LegacyTextField.TextFieldConfigurationBlock = { view in }) {
        self._isFirstResponderSender = isFirstResponderSender
        self._text = text
        self.shouldReturn = shouldReturn
        self.didFocused = didFocused
        self.configuration = configuration
    }
    
    
    public func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        view.addTarget(context.coordinator, action: #selector(Coordinator.textViewDidChange), for: .editingChanged)
        view.delegate = context.coordinator
        return view
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if isFirstResponderSender {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator($text, didFocused: didFocused, shouldReturn: shouldReturn)
    }
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        public var didFocused: FocusChangedBlock
        
        public var shouldReturn: ShouldReturnBlock
        
        public init(_ text: Binding<String>, didFocused: @escaping FocusChangedBlock, shouldReturn: @escaping ShouldReturnBlock) {
            self._text = text
            self.didFocused = didFocused
            self.shouldReturn = shouldReturn
        }
        
        @objc public func textViewDidChange(_ textField: UITextField) {
            self.text = textField.text ?? ""
        }
        
        public func textFieldDidBeginEditing(_ textField: UITextField) {
            // should not use binding here as it changes view state during update
            didFocused(.focused)
        }
        
        public func textFieldDidEndEditing(_ textField: UITextField) {
            // should not use binding here as it changes view state during update
            didFocused(.unFocused)
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            shouldReturn()
        }
    }
}


extension String {
    
    var withSingleTrailingSpace:  String {
        appending(" ")
    }
    
    var withSingleLeadingSpace:  String {
        " " + self
    }
}

