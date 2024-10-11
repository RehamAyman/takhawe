//
//  homeVC+collectionDelegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 01/11/2023.
//

import UIKit


extension homeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
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
    
    
    
    
    
    //MARK: - profile info
    func getProfileDetails (withLoading : Bool) {
        
        if withLoading {
            activityIndicatorr.startAnimating()
        }
        UserRouter.getProfile.send { [weak self ]  ( response : APIGenericResponse<profileResult> ) in
            guard let self = self else { return }
            if let result = response.result {
                if let imageString = result.avatar {
                    let avatar = Server.imageBase.rawValue + imageString
                 //   self.userimageOutlet.setImage(image: avatar)
                    self.sideMenuAvatar.setImage(image: avatar)
                }
              
                self.sideMenuEmail.text = result.email ??  UserDefaults.user?.user?.email ?? "--"
                self.sideMenuUserName.text = result.name ?? UserDefaults.user?.user?.name ?? "--"
            }
        }
    }
    
    //MARK: - recive updates profile info
    
    @objc func handleCustomNotification(_ notification: Notification) {
        self.getProfileDetails(withLoading: false )
    }
    
    
}
