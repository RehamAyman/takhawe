//
//  ReserveTheTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//
//  Template by MGAbouarab®


import UIKit
import Lottie
import PassKit



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
   
    let DummyPaymentMethods : [dummyPaymentMethods] = [

        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "wallet", selected: false , id: .wallet ) ,
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "cash", selected: false , id: .cash) ,
        dummyPaymentMethods(icon:"" , number: "**** **** **** 8970", expireIn: "Expires: 12/26", type: "ApplePay", selected: false , id: .applePay)
    ]

    
    
    
    let paymentHandler = PaymentHandler()
 
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        
   

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

        
       
        
        if self.paymentMethod == .applePay {
            
            
            
            
            self.paymentHandler.startPayment(total: appletotalPrice ,
                                             VAT:  applevatPrice ,
                                             serviceCost: appleseatPrice  ) { success  in
                if success {
                    print("success ")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        if self.viptrip {
                            self.GotoNextStep(tripId: self.offer?.trip_id ?? 0 )
                           
                        } else {
                            self.GotoNextStep(tripId: self.tripDetails?.id ?? 0 )
                        }
                    }
                
                    
                    
                } else {
                    
                    
                    print( "failed ")
                }
            }
            
            
        } else {
            if viptrip {
                self.confirmOffer()
            } else {
                self.joinAbasicTrip()
            }
        }
        
        
    }
    
    
    
    
    func GotoNextStep (tripId : Int ) {
        let vc = successBookViewVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        if viptrip {
            vc.drivername = self.offer?.driver?.name ?? ""
        } else {
            vc.drivername = self.tripDetails?.driver_name ?? ""
        }
    vc.action = {
        let vc = trackYourTripVC()
        vc.vipTrip = self.viptrip
        vc.tripId = tripId
        vc.basicPickLat = self.tripDetails?.pickuplocation?.lat ?? 0
        vc.basicPickLng =  self.tripDetails?.pickuplocation?.lng ?? 0
        vc.basicDesLat = self.tripDetails?.destinationlocation?.lat ?? 0
        vc.basicDesLng = self.tripDetails?.destinationlocation?.lng ?? 0
    
        self.push(vc)
    }
        self.present( vc , animated: true )
    }
}


//MARK: - Networking -
extension ReserveTheTripVC {
    
    
    func confirmOffer ( ) {
        print(self.paymentMethod)
        print(self.paymentMethod.rawValue)
        activityIndicatorr.startAnimating()
     
        UserRouter.acceptOffer(id: offer?.id ?? 0 , paymentMethod: self.paymentMethod.rawValue  ).send { [weak self ] (response: APIGlobalResponse) in
            guard let self = self else { return }
            if response.status == true {
                self.GotoNextStep(tripId: offer?.trip_id ?? 0 )
            }
        }
    }
    
    func joinAbasicTrip () {
        print(self.paymentMethod)
        print(self.paymentMethod.rawValue)
        activityIndicatorr.startAnimating()
        UserRouter.joinABasicTrip(id: tripDetails?.id ?? 0 , paymentMethod: self.paymentMethod.rawValue , copon: "").send {[weak self] ( response : APIGlobalResponse ) in
            guard let self = self else { return }
            if  response.status == true  {
                self.GotoNextStep(tripId: tripDetails?.id ?? 0 )
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
    
}
