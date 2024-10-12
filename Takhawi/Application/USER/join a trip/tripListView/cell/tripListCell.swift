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
    
    @IBOutlet weak var bag: UIImageView!
    @IBOutlet weak var blutooth: UIImageView!
    @IBOutlet weak var backSeat: UIImageView!
    @IBOutlet weak var heat: UIImageView!
    @IBOutlet weak var charge: UIImageView!
    @IBOutlet weak var driverPhoto: UIImageView!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var driverRate: JStarRatingView!
    @IBOutlet weak var driverName: UILabel!
   
    @IBOutlet weak var TripDate: UILabel!
    @IBOutlet weak var seatPrice: UILabel!
    
    @IBOutlet weak var destinationName: UILabel!
    @IBOutlet weak var availableSeatsLabel: UILabel!
    
    @IBOutlet weak var wifiIcon: UIImageView!
    @IBOutlet weak var ACicon: UIImageView!
    
    @IBOutlet weak var smokeIcon: UIImageView!
    @IBOutlet weak var foodIcon: UIImageView!
    @IBOutlet weak var musicicon: UIImageView!
    @IBOutlet weak var startLocation: UILabel!
    
    
    
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
    func configureWith(data: BasicTripResult ) {
        self.startLocation.text = data.startLocation ?? ""
        self.destinationName.text = data.destinationlocationname ?? ""
        self.driverName.text = data.driver_name ?? "--"
        self.seatPrice.text = "\(data.basic_trip_price_per_seat ?? 0)"
        self.startTime.text = data.start_date?.convertFromIsoToTimee()
        self.endTime.text = data.end_date?.convertFromIsoToTimee()
        self.TripDate.text = data.start_date?.convertFromIso()
        self.availableSeatsLabel.text =  "\(data.basic_trip_available_seats_no ?? 0 ) " +  "seats are Available".localize
        if let avatar = data.driver_avatar {
            let url = Server.imageBase.rawValue + avatar
            self.driverPhoto.setImage(image: url)
            
            
            
        }
         
        
       
        if let features = data.features {
           
            self.ACicon.tintColor = features.contains("AIR CONDITIONER") ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.wifiIcon.tintColor = features.contains(Features.wifi.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.musicicon.tintColor = features.contains(Features.music.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.foodIcon.tintColor = features.contains(Features.food.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.smokeIcon.tintColor = features.contains(Features.noSmoking.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.heat.tintColor = features.contains(Features.haeting.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.charge.tintColor = features.contains(Features.charging.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.backSeat.tintColor = features.contains(Features.backScreens.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.bag.tintColor = features.contains(Features.bags.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            self.blutooth.tintColor = UIColor.systemGray5
           // cell.babyIcon.tintColor = features.contains(Features.pet.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
           
        }
        
        
    }
    
    
    //MARK: - Actions -
    
    
}

