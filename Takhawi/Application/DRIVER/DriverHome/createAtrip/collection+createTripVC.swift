//
//  File.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/02/1446 AH.
//

import UIKit
extension driverCreateTripVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout ,  UITextFieldDelegate  {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Get the current text in the text field
        
        if textField == self.availableSeats {
            let currentText = textField.text ?? ""
            
            // Calculate the new length after editing
            let newLength = currentText.count + string.count - range.length
            
            // Restrict to 3 characters max
            return newLength <= 3
            
        }
        return true
    }
    
    
    
    
    
    
    
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.dummyActivty.count
        }

    
    
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chooseFeatureCell", for: indexPath) as! chooseFeatureCell
            let item = self.dummyActivty[indexPath.row]
            
            cell.featureImage.image = UIImage(named: item.icon)
            cell.featureImage.image = cell.featureImage.image?.withRenderingMode(.alwaysTemplate)
            cell.featureImage.tintColor = UIColor.lightGray
            cell.featureImage.addTapGesture {
                if cell.featureImage.tintColor == UIColor.lightGray  {
                    cell.featureImage.tintColor = UIColor(named: "MainColor")
                    self.selectedFeatures.append(item.name)
                } else {
                    
                    cell.featureImage.tintColor = UIColor.lightGray
                    if self.selectedFeatures.contains(item.name) {
                        self.selectedFeatures.removeAll { $0 == item.name }
                    }
                }
            }
          
            return cell
        }
        
        
       
    
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let label = UILabel(frame: CGRect.zero)
            label.text = self.dummyActivty[indexPath.item].name
              label.sizeToFit()
            return CGSize(width: 25  , height: 25 )
        }
       
        
    
    
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        }
        
        
        
        
        
     
        
        
        
        
        


}
