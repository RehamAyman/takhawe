//
//  tripListVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/10/2023.
//
//  Template by MGAbouarab®

import UIKit


//MARK: - ViewController
class tripListVC: BaseVC {
    
    //MARK: - IBOutlets -
    @IBOutlet weak private var tableView: UITableView!
    
    
    
    @IBOutlet weak var searchContainerView: UIView!
    //MARK: - Properties -
    private var items: [Dummydrivers] = [
        Dummydrivers(name: "Ali Adam", rate: 4) ,
        Dummydrivers(name: "Ahmed Omar ", rate: 2) ,
        Dummydrivers(name: "Waleed Ismail", rate: 3)
    ]
    
    
   
    
    // MARK: - UIViewController Events -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setupTableView()
    }
    
    
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.searchContainerView.layer.applySketchShadow()
        
    }
    
//MARK: - Logic Methods -
    
    
    
    
//MARK: - Actions -
    @objc func refresh() {
        self.tableView.refreshControl?.endRefreshing()
     self.tableView.animateToTop()
    }
    
    
    @IBAction func filter(_ sender: UIButton) {
        sender.animateButtonWhenPressed {
            let vc = filterViewVC()
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overCurrentContext
            self.present( vc , animated: true )
        }
      
    }
    
    
}


//MARK: - Start Of TableView -
extension tripListVC {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        tableView.register(UINib(nibName: "tripListCell", bundle: nil), forCellReuseIdentifier: "tripListCell")
     //   self.tableView.register(cellType: tripListCell.self, bundle: nil)
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.tableView.tableFooterView = UIView(frame: .zero)
        //self.tableView.addRefresh(action: #selector(self.refresh))
    }
}
extension tripListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripListCell") as! tripListCell
        let item = self.items[indexPath.row]
        cell.configureWith(data: item)
        return cell
    }
}
extension tripListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = driverProfileVC()
        push(vc)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}






//MARK: - End Of TableView -





//MARK: - Networking -
extension tripListVC {
    
}





//MARK: - Routes -
extension tripListVC {
    
}





struct Dummydrivers {
    let name : String
    let rate : Double
}
