//
//  profileVc+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/10/2023.
//

import UIKit



extension profileVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dummyActivty.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! profileCell
        let item = self.dummyActivty[indexPath.row]
        cell.name.text = item.name
        cell.icon.image = UIImage(named: item.icon)
      
        return cell
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = self.dummyActivty[indexPath.item].name
          label.sizeToFit()
        return CGSize(width: label.frame.width  , height: 55)
    }
    

    
    
}


struct dummyActivity  {
    let icon : String
    let name : String
}
