//
//  selectComplainVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class selectComplainVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
  
    
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var tableview: UITableView!
    //MARK: - Properties -
    
    

    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.AddTOPCornersView(num: 35 )
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(cellType: selectYourComplainCell.self)
    }
    
    //MARK: - Logic Methods -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectYourComplainCell", for: indexPath) as! selectYourComplainCell
        
        return cell
    }
    
    
    
    //MARK: - Actions -

    @IBAction func selectItem(_ sender: UIButton) {
    }
    @IBAction func dismiss(_ sender: UIButton) {
    }
}


//MARK: - Networking -
extension selectComplainVC {
    
}

//MARK: - Routes -
extension selectComplainVC {
    
}
