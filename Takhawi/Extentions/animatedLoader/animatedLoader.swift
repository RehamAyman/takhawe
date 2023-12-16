//
//  animatedLoader.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//


import UIKit
import Lottie
import PureLayout





var activityIndicatorr: CustomActivityIndicator = {
    return CustomActivityIndicator()
}()




private var progressView: LottieAnimationView?


class CustomActivityIndicator: UIView {
    
    private var lottieView: LottieAnimationView?
    
    private var loaderImageName = "loading"
    
    private convenience init() {
        
        self.init(frame: UIScreen.main.bounds)
        
        loaderImageName = ""
        
    }
    private func setupUI() {

            backgroundColor = .clear

            let blurEffect = UIBlurEffect(style: .light)

            let blurView = UIVisualEffectView(effect: blurEffect)

            insertSubview(blurView, at: 0)

            blurView.autoPinEdgesToSuperviewEdges()

            self.lottieView = .init(name:  "ShvaeVGKuz") //"uaRUu5r4gI" )

            if let lottieView = lottieView {

                addSubview(lottieView)

                let size = self.frame.width * 0.95

                lottieView.autoSetDimensions(to: CGSize(width: size, height: size))

                lottieView.autoCenterInSuperview()

                lottieView.loopMode = .loop

                lottieView.contentMode = .scaleAspectFit

            }

        }
    public func startAnimating() {
        
        if self.lottieView == nil {
            
            self.setupUI()
            
            DispatchQueue.main.async { [weak self] in
                
                self?.showLoadingActivity()
                
            }
            
        }
        
    }
    
    public func stopAnimating() {
        
        DispatchQueue.main.async {[weak self] in
            
            self?.stopAnimation()
            
        }
        
    }
    
    public func isAnimating() -> Bool {
        
        guard let lottieView = lottieView else {
            
            return false
            
        }
        
        return lottieView.isAnimationPlaying
        
    }
    
    
    private func showLoadingActivity() {
        
        startAnimation()
        
        UIApplication.shared.windows.first?.addSubview(self)
        
        self.isUserInteractionEnabled = false
        
    }
    
    private func startAnimation() {
        
        guard let lottieView = lottieView else { return }
        
        lottieView.play()
        
    }
    
    private func stopAnimation() {
        
        lottieView?.stop()
        
        lottieView?.removeFromSuperview()
        
        lottieView = nil
        
        self.removeFromSuperview()
        
        self.isUserInteractionEnabled = true
        
    }
    
  
}
