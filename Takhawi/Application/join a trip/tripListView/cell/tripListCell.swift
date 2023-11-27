//
//  tripListCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/10/2023.
//
//  Template by MGAbouarab®

//MARK:- Cell
import UIKit

//MARK: - UITableViewCell -
class tripListCell: UITableViewCell {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var driverRate: JStarRatingView!
    @IBOutlet weak var driverName: UILabel!
   
    
    
    //MARK: - properties -
    
    
    //MARK: - Overriden Methods-
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupDesign()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.resetCellData()
    }
    
    //MARK: - Design Methods -
    private func setupDesign() {
        self.selectionStyle = .none
    }
    private func resetCellData() {
        
    }
    
    //MARK: - Configure Data -
    func configureWith(data: Dummydrivers ) {
        
    }
    
    
    //MARK: - Actions -
    
    
}
