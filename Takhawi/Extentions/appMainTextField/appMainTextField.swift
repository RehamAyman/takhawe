//
//  appMainTextField.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//

import MaterialComponents




extension MDCOutlinedTextArea {
    
    
    func handelTextArea (placeHolder : String) {
        
        self.setOutlineColor(UIColor( named: "MainColor") ?? UIColor.black, for: .normal)
        self.setOutlineColor(UIColor( named: "MainColor") ?? UIColor.black, for: .editing)
        self.setFloatingLabel(  UIColor( named: "MainColor") ?? UIColor.black , for: .editing)
        self.setNormalLabel( UIColor( named: "MainColor") ?? UIColor.black , for: .normal)
        

        self.placeholder = placeHolder
        self.preferredContainerHeight = 112
        self.leadingEdgePaddingOverride = 25
        self.containerRadius = 20
    }
}
