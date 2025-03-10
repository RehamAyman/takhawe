//
//  ReserveTheTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//
//  Template by MGAbouarab®


import UIKit
import Lottie




class ReserveTheTripVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var topBackView: UIView!
    @IBOutlet weak var promorCodeStack: UIStackView!
    @IBOutlet weak var checkCodeOutlet: UIButton!
    
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var priceIndicator: UIActivityIndicatorView!
    @IBOutlet weak var seatPrice: UILabel!
    @IBOutlet weak var destance: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var dicountCodeTextField: UITextField!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var paymentMethodTable: UITableView!
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var tripDate: UILabel!
    @IBOutlet weak var codePrice: UILabel!
    @IBOutlet weak var vatCost: UILabel!
    
    
    
    
    //MARK: - Properties -
    var selectedItem : Int = 0 
    var viptrip : Bool = false 
    var offer : offerResult?
    var paymentMethod : paymentMethod = .cash
    var locationDetails : offerLocation?
    let logoAnimation = LottieAnimationView(name: "Q2ix9ldDnm")
    var tripDetails : BasicTripResult?
    var tripId : Int = 0 
    var appleseatPrice : String = ""
    var applevatPrice : String = ""
    var appletotalPrice : String = ""
    var selectedCard : Int = 0 
   
    var  DummyPaymentMethods : [dummyPaymentMethods] = [
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "wallet", selected: false , id: .wallet, cardID: 0 ) ,
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "cash", selected: false , id: .cash, cardID: 0),
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "ApplePay", selected: false , id: .applePay, cardID: 0)
    ]

 //   let paymentHandler = PaymentHandler()
 
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        
   
        self.getAllSavedCards()
    }
    
    
    

//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        
        driverImage.layer.addBasicShadow(cornerRadius: 33.5)
        topBackView.layer.addBasicShadow(cornerRadius: 10)
        paymentMethodTable.dataSource = self
        paymentMethodTable.delegate = self 
        paymentMethodTable.isScrollEnabled = false
        paymentMethodTable.register(UINib(nibName:"reserveTheTripCell", bundle: nil), forCellReuseIdentifier: "reserveTheTripCell")
        self.dicountCodeTextField.setLeftPaddingPoints(12)
        self.dicountCodeTextField.setRightPaddingPoints(12)
        self.dicountCodeTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        if self.viptrip {
            self.getVipDetails()
            self.calculateVipPrice()
        } else {
            self.getBasicTripDetails()
            self.calculateTheBasicPrice(code: "")
        }
        
        self.checkCodeOutlet.addTapGesture {
            self.checkPromoCode()
        }
  
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.removeLottieCheckMark()
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func confirmTrip(_ sender: UIButton) {

       
            if viptrip {
                self.confirmOffer()
            } else {
                self.joinAbasicTrip()
            }
      
    }
    
    
    
    
   
    
    
}






//MARK: - Networking -
extension ReserveTheTripVC {
    
    
    func confirmOffer () {
        print("confirm vip action")
        print(self.paymentMethod)
        print(self.paymentMethod.rawValue)
        activityIndicatorr.startAnimating()
        
        
        UserRouter.acceptOffer(id: offer?.id ?? 0 , paymentMethod: self.paymentMethod.rawValue, cardId: self.paymentMethod == .card ? self.selectedCard : 0  ).send { [weak self ] (response: APIGlobalResponse) in
            guard let self = self else { return }
            if response.status == true {
                self.GotoNextStep(tripId: offer?.trip_id ?? 0, appleCheckOutId: "" )
            }
        }
    }
    
    
    
    func joinAbasicTrip () {
        print("confirm basic action ")
        print(self.paymentMethod.rawValue)
       
        
        activityIndicatorr.startAnimating()
        UserRouter.joinABasicTrip(id: tripDetails?.id ?? 0 , paymentMethod: self.paymentMethod.rawValue , copon: self.dicountCodeTextField.text ?? "" , cardid: self.paymentMethod == .card ? self.selectedCard : 0 ).send {[weak self] ( response : APIGenericResponse<checkOutModel>) in
            guard let self = self else { return }
            if  response.status == true  {
                self.GotoNextStep(tripId: tripDetails?.id ?? 0, appleCheckOutId: response.result?.checkOutId ?? ""  )
            }
        }
    }
    
    
    
    
    func calculateTheBasicPrice (code : String) {
     
        if let id = self.tripDetails?.id {
            priceIndicator.startAnimating()
            priceIndicator.isHidden = false
            UserRouter.claculateBasicPrice(id: id , code: code ).send { [weak self ] (response : APIGenericResponse<BasicPriceResult>) in
                guard let self = self else { return }
                self.priceIndicator.stopAnimating()
                self.priceIndicator.isHidden = true
               
                if let res =  response.result {
                    self.totalPrice.text =  "\(res.total_price ?? 0)" + " " + "SAR".localize
                    self.appletotalPrice = "\(res.total_price ?? 0)"
                    self.appleseatPrice = "\(res.price ?? 0)"
                    self.applevatPrice = "\(res.app_share ?? 0)"
                    
                    self.vatCost.text = "\(res.app_share ?? 0)" + " " + "SAR".localize
                    if res.discount != 0 {
                        self.codePrice.text =  "\(res.discount ?? 0)" + " " + "SAR".localize
                        self.promorCodeStack.isHidden = false
                    }else {
                        self.codePrice.text = "--"
                        self.promorCodeStack.isHidden = true
                    }
                }
                

            }
        }
    }
    
    func calculateVipPrice () {
        
        if let id = self.offer?.id  {
            priceIndicator.startAnimating()
            priceIndicator.isHidden = false
         
            
            UserRouter.calculateVipPrice(id: id).send { [weak self ] (response : APIGenericResponse<BasicPriceResult>) in
                guard let self = self else { return }
                self.priceIndicator.stopAnimating()
                self.priceIndicator.isHidden = true
               
                if let res =  response.result {
                    self.totalPrice.text =  "\(res.total_price ?? 0)" + " " + "SAR".localize
                    self.vatCost.text = "\(res.app_share ?? 0)" + " " + "SAR".localize
                    self.applevatPrice =  "\(res.app_share ?? 0)"
                    self.appleseatPrice =  "\(res.price ?? 0)"
                    self.appletotalPrice = "\(res.total_price ?? 0)"
                    if res.discount != 0 {
                        self.codePrice.text =  "\(res.discount ?? 0)" + " " + "SAR".localize
                        self.promorCodeStack.isHidden = false
                    }else {
                        self.codePrice.text = "--"
                        self.promorCodeStack.isHidden = true
                    }
                }
                

            }
        }
    }
    
    func checkPromoCode () {
        priceIndicator.startAnimating()
        priceIndicator.isHidden = false
        if self.dicountCodeTextField.text != "" {
            
            
            UserRouter.checkPromoCode(code: self.dicountCodeTextField.text ?? "" ).send {  ( response : APIGlobalResponse )  in
        
                self.priceIndicator.stopAnimating()
                self.priceIndicator.isHidden = true
                    if response.status == true { // valid
                       
                        if self.viptrip {
                            self.calculateVipPrice()
                            self.replaceCheckButton()
                        } else {
                            self.calculateTheBasicPrice(code : self.dicountCodeTextField.text ?? "" )
                            self.replaceCheckButton()
                        }
                        
                    } else { // not valid
                        print("no action ")
                    }
                }
            }
        
    }
    

}

//MARK: - Routes -
extension ReserveTheTripVC {
    
    
     func getAllSavedCards () {
        activityIndicatorr.startAnimating()
        UserRouter.getAllPaymentCards.send {  [weak self ] (response : APIGenericResponse<[cardResult]> ) in
            guard let self = self else { return }
            
            if let response = response.result {
                for i in response {
                    let month = i.card_exp_month ?? ""
                    let year = i.card_exp_year ?? ""
                    
                    self.DummyPaymentMethods.append(dummyPaymentMethods(icon: "visa",
                                                                        number: "**** **** **** \(i.card_number ?? "" )"   ,
                                                                        expireIn:  month +  "-" +  year  ,
                                                                        type:  "card" ,
                                                                        selected: false ,
                                                                        id: .card ,
                                                                        cardID : i.id ?? 0
                                                                        
                                                                       ))
                    
                }
                
                self.paymentMethodTable.reloadData()
            }
           
            
        }
    }
}
