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



extension MDCOutlinedTextField {
    func handelTextField (placeHolder : String) {
        self.setOutlineColor(UIColor( named: "MainColor") ?? UIColor.black, for: .normal)
        self.setOutlineColor(UIColor( named: "MainColor") ?? UIColor.black, for: .editing)
        self.placeholder = placeHolder
        self.setFloatingLabelColor( UIColor( named: "MainColor") ?? UIColor.gray , for: .editing)
        self.setFloatingLabelColor( UIColor( named: "MainColor") ?? UIColor.gray , for: .normal )
        self.setNormalLabelColor( UIColor.gray  , for: .normal)
        self.preferredContainerHeight = 50
        self.leadingEdgePaddingOverride = 20
        self.setLeftPaddingPoints(5)
        self.setRightPaddingPoints(5)
        self.containerRadius = 25
       // self.sizeToFit()
    }
}
