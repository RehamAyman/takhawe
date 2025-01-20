//
//  sosCallsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/07/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class sosCallsVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainView: UIView!
    
//MARK: - Properties -
    
    
    
    
    let items : [sosItem] = [
        sosItem(name: "رقم الطوارئ الموحد", number: "911") ,
        sosItem(name: "الشرطة", number: "999") ,
        sosItem(name: "الدفاع المدني", number: "998") ,
        sosItem(name: "المرور", number: "993") ,
        sosItem(name: "الاسعاف", number: "997") ,
        sosItem(name: "امن الطرق", number: "996") ,
        sosItem(name: "نجم (لحوادث المركبات المؤمنة)", number: "920000560")
        
        
    ]
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: sosCell.self)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func dismissSheet(_ sender: UIButton) {
        self.dismiss(animated: true )
    }
}


//MARK: - Networking -
extension sosCallsVC {
    
}

//MARK: - table view methods -
extension sosCallsVC : UITableViewDelegate , UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sosCell") as! sosCell
        cell.selectionStyle = .none
        cell.name.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        print(item)
        self.callNum(number: item.number)
        
    }
    
    
    private func callNum ( number : String) {
        if let phoneURL = URL(string: "tel://\(number)") {
               if UIApplication.shared.canOpenURL(phoneURL) {
                   UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
               } else {
                   print("Phone call not supported on this device.")
               }
           } else {
               print("Invalid phone number.")
           }
        
    }
    
    
    
}

struct sosItem  {
    let name : String
    let number : String
}
