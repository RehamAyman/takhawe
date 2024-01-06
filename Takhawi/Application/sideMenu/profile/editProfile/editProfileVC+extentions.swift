//
//  editProfileVC+extentions.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/01/2024.
//

import UIKit

extension editProfileVC   {
 
    
    func handleTextfields () {
    self.name.label.text = "Name".localize
    self.name.handelTextField(placeHolder: "Name".localize)
    self.emailTextField.label.text = "Email address".localize
    self.emailTextField.handelTextField(placeHolder: "Email address".localize)
    self.cityText.label.text = "City".localize
    self.cityText.handelTextField(placeHolder: "City".localize )
    self.birthdateText.label.text = "Birthday".localize
    self.birthdateText.handelTextField(placeHolder: "Birthday".localize )
    self.phoneNumber.label.text = "Phone Number".localize
    self.phoneNumber.handelTextField(placeHolder: "Phone Number".localize )
    self.genderText.label.text = "Gender".localize
    self.genderText.handelTextField(placeHolder: "Gender".localize )
    self.hobbies.label.text = "Hobbies".localize
    self.hobbies.handelTextField(placeHolder: "Hobbies".localize )
    self.FavouritesTextArea.handelTextArea(placeHolder: "Favourites".localize)
    self.FavouritesTextArea.label.text = "Favourites".localize
    
    }
    func birthDayAction () {
        self.birthdateText.addTapGesture {
            
        }
    }
    
    
    
 //MARK: - COLLECTION VIEW METHODS
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.dummyHobbies.count
//    }
//    
//    
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hobbiesCellCollectionViewCell", for: indexPath) as! hobbiesCellCollectionViewCell
////        cell.hobbieName.text = self.dummyHobbies[indexPath.item].name
////        cell.icon.image = UIImage(named:  self.dummyHobbies[indexPath.item].icon )
//        return cell
//    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let label = UILabel(frame: CGRect.zero)
////        label.text = self.dummyHobbies[indexPath.item].name
////        label.sizeToFit()
//        return CGSize(width: self.collectionview.frame.width * 0.3  , height: 45  )
//    }
//    
    
   
    
    
    
    
}
