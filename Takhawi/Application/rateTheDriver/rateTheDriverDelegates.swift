//
//  rateTheDriverDelegates.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//

import UIKit


extension rateTheDriverVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
  
    
    
//MARK: -   RATE ACTION

    func rateaction () {
        rateView.addTapGesture {
            print(self.rateView.rating)
            let rate = self.rateView.rating
            
            
            switch rate {
            case 1 :
                print("poor")
                self.rateLabel.text = "Poor".localize
                self.rateSecLabel.text = "You rated ( driver name) 1 star".localize
            case 2:
                print("not bad")
                self.rateLabel.text = "Not Bad".localize
                self.rateSecLabel.text = "You rated ( driver name) 2 stars".localize
            case 3:
                print("good")
                self.rateLabel.text = "Good".localize
                self.rateSecLabel.text = "You rated ( driver name) 3 stars".localize
            case 4:
                print("very good")
                self.rateLabel.text = "Very Good".localize
                self.rateSecLabel.text = "You rated ( driver name) 4 stars".localize
            case 5 :
                print("Excellent")
                self.rateLabel.text = "Excellent".localize
                self.rateSecLabel.text = "You rated ( driver name) 5 stars".localize
            default:
                return
            }
           
            
            
            
            
            
            
        }
    }
    
    
//MARK: -   collection view methods
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tips.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tipsCell", for: indexPath) as! tipsCell
        let item = self.tips[indexPath.item]
        cell.tipCost.text = item
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60 , height: 60 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        guard let cell = collectionView.cellForItem(at: indexPath) as?  tipsCell else {
            return
        }
        
        cell.backView.backgroundColor = UIColor(named: "MainColor")
        cell.tipCost.textColor = UIColor.white
        cell.currncy.textColor = UIColor.white
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as?  tipsCell else {
            return  }
        
        cell.backView.backgroundColor = UIColor.systemGray6
        cell.tipCost.textColor = UIColor(named: "SecondFontColor")
        cell.currncy.textColor = UIColor(named: "SecondFontColor")
        
    }
    
    
    
    
    
    
}
