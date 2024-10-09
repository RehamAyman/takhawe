//
//  accedintViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class accedintViewVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet var allViewsOutlet: [UIView]!
    
    @IBOutlet weak var backView: UIVisualEffectView!
    @IBOutlet weak var mainView: UIView!
    
    
//MARK: - Properties -
    var passedLat : Double = 0.0
    var passedLng : Double = 0.0
    var action: ((Double , Double , String , String ) -> Void)?
    var selectedTag : Int = 10
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.addTopLeftCoreners(num: 20 )
        self.handleViewsAction()
        self.backView.addTapGesture {
            self.dismiss(animated: true )
        }
        
    }
    
    
    
//MARK: - Logic Methods -
    private func handleViewsAction () {
       
        for i in self.allViewsOutlet {
            
            self.handleSelectionAction(uiview: i)
          
        }
    }
    
   
//MARK: - Actions -
    
    @IBAction func report(_ sender: UIButton) {
        switch self.selectedTag {
           
        case 0 :
            
            self.reportAnIssue(enType: "Radar" , arType: "Radar".localize )
        case 1 :
            self.reportAnIssue(enType: "Animals" , arType: "Animals".localize )
        case 2:
            self.reportAnIssue(enType: "Accident" , arType: "Accident".localize )
        case 3:
            self.reportAnIssue(enType: "Changing directions" , arType: "Changing directions".localize )
        case 4:
            self.reportAnIssue(enType: "Alert" , arType: "Alert".localize )
        case 5:
            self.reportAnIssue(enType: "Hole" , arType: "Hole".localize )
        case 6 :
            self.reportAnIssue(enType: "Speed" , arType: "Speed".localize )
        case 7 :
            self.reportAnIssue(enType: "Works" , arType: "Works".localize )
            
        default:
            print("def")
        }
        
    }
    
    
    
    
   private func handleSelectionAction ( uiview : UIView) {
        uiview.addTapGesture {
            self.selectedTag = uiview.tag
            print(self.selectedTag)
            
            
            
            self.allViewsOutlet.forEach { view in
                view.backgroundColor = .clear
            }
            uiview.layer.cornerRadius = 10
            uiview.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6 )
            
        }
    }
    
    
    func reportAnIssue ( enType : String , arType : String )  {
        
        
        activityIndicatorr.startAnimating()
        
        DriverRouter.markReport(lat: self.passedLat , lng: self.passedLng , enType: enType , arType: arType ).send { [weak self ] ( response : APIGlobalResponse  )in
            guard let self = self else { return }
            self.dismiss(animated:  true )
            self.action?(self.passedLat, self.passedLng , enType , arType )
        }
    }
    
    
    
    

    
}


//MARK: - Networking -
extension accedintViewVC {
    
}

//MARK: - Routes -
extension accedintViewVC {
    
}
