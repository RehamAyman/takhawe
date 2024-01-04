//
//  swiftRegister+extention .swift
//  Takhawi
//
//  Created by Mac on 22/12/2023.
//

import UIKit

extension swiftRegisterVC : UICollectionViewDelegate , UICollectionViewDataSource
, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstAuthCell", for: indexPath) as! firstAuthCell
            cell.emailTextField.handelTextField(placeHolder: "Enter Your Email Address")
            if LocalizationManager.shared.getLanguage() == .English {
                cell.emailTextField.label.text = "Email"
            }
           
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secauthCell", for: indexPath) as! secauthCell
            return cell
        }
    
    }
    
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.width , height: collectionView.height)
    }
     
     
    
}
