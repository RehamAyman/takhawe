//
//  OnboardingViewController.swift
//  Takhawi
//
//  Created by Sara Mady on 22/07/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    var slides: [OnboardingSlide] = []

    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       
        if UserDefaults.user != nil && UserDefaults.isLogin == true{
            let userType = UserDefaults.user?.user?.role
            if userType == role.user.rawValue {
                
                let vc =   homeVC()
                let nav = CustomNavigationController(rootViewController: vc)
                AppHelper.changeWindowRoot(vc: nav)
            } else {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "DriverTabbar") as! DriverTabbar
                let nav = CustomNavigationController(rootViewController: vc)
                AppHelper.changeWindowRoot(vc: nav)
            }
                
         
            
            
        } else {
            let vc =  onboardingSwiftuiVC()
            let nav = CustomNavigationController(rootViewController: vc)
            AppHelper.changeWindowRoot(vc: nav)
        }
       
     
        
        
        //storyboard.instantiateViewController(withIdentifier: "DriverTabbar") as! DriverTabbar
       //   let vc =    //  LoginVC()//
    //    let vc = phoneAndLocationVC()  // onboardingSwiftuiVC()   // driverAuthVC() //phoneAndLocationVC() //  onboardingSwiftuiVC()  // homeVC()      //  trackYourTripVC()  //     //  trackYourTripVC()
//        self.navigationController?.pushViewController(vc, animated: true)

       

        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(named: "download")!),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "download")!),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "download")!)
        ]

        pageControl.numberOfPages = slides.count
    }

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let vc = LoginVC()
            self.navigationController?.pushViewController(vc, animated: true)

        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
