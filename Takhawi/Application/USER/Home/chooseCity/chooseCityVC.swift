//
//  chooseCityVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/08/2024.
//
//  Template by MGAbouarab®


import UIKit

class chooseCityVC: BaseVC , UITableViewDelegate , UITableViewDataSource {
   
    
    
    
//MARK: - IBOutlets -


    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //MARK: - Properties -
    
    
    var allCities : [CitiesResult] = []
    var pationation : Pagination?
    var isLastPage : Bool = false
    var action: ((CitiesResult) -> Void)?
   
    
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getAllCities()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: cityCell.self)
       
        self.progressIndicator.isHidden = true
    }
    
//MARK: - Logic Methods -
    private func showLoading (play : Bool) {
        if play {
            self.progressIndicator.startAnimating()
            self.progressIndicator.isHidden = false
        } else {
            self.progressIndicator.stopAnimating()
            self.progressIndicator.isHidden = true
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! cityCell
        cell.selectionStyle = .none
        let item = self.allCities[indexPath.row]
        cell.title.text = item.name
        cell.addTapGesture {
            self.action?(item)
            self.dismiss(animated: true )
        }
        
    return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.allCities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
        if indexPath.row == self.allCities.count - 1 && !isLastPage {
           
            let page = self.pationation?.page ?? 0
            self.getMoreCities(page: page + 1 )
        }
    }
    // pagination
    
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension chooseCityVC {
    func getAllCities () {
        self.showLoading(play: true )
        UserRouter.getAllCities(page: 1).send { [weak self ] (response: APIGenericResponse<[CitiesResult]> ) in
            guard let self = self else { return }
            
            if response.status == true {
                if response.paginate?.page == response.paginate?.totalPages {
                    self.isLastPage = true
                }
               
                self.pationation = response.paginate
                self.allCities = response.result ?? []
                self.tableView.reloadData()
            }
            self.showLoading(play: false )
            
        }
    }
    
    func getMoreCities ( page : Int) {
        self.showLoading(play: true )
        UserRouter.getAllCities(page: page).send { [weak self ] (response: APIGenericResponse<[CitiesResult]> ) in
            guard let self = self else { return }
            
            if response.status == true {
                if response.paginate?.page == response.paginate?.totalPages {
                   
                  
                    self.isLastPage = true
                }
                
                self.pationation = response.paginate
                self.allCities += response.result ?? []
                self.tableView.reloadData()
                self.showLoading(play: false  )
            }
        }
    }
}

//MARK: - Routes -
extension chooseCityVC {
    
}
