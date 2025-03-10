//
//  paymentWebView.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/04/1446 AH.
//



import UIKit
import WebKit
import Alamofire

class paymentWebView : UIViewController, WKNavigationDelegate {
    
    var action: (() -> Void)?
    var webView: WKWebView!
    var webUrl : String =  Server.baseURL.rawValue + "saved-card"
    var requestMethod : HTTPMethod = .post
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the web view
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        // Set up URLRequest with custom header
        if let url = URL(string: self.webUrl) {
            var request = URLRequest(url: url)
            request.setValue( UserDefaults.accessToken ?? "" , forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
            request.method = self.requestMethod
            webView.load(request)
        }
    }

       
       // Called when the web view begins loading content
       func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
           print("Started loading")
       }
       
       // Called when the web content starts arriving
       func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
           print("Content started arriving")
       }
       
       // Called when the navigation is complete (page loaded successfully)
       func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         
           print(self.webView.url)
           //registration-status
           guard let url = webView.url?.absoluteString else { return }
           print("🌏🌏🌏web url lisiner 🌏🌏")//success
           print(url)
           if url.contains("success") {
               self.action?()
               self.dismiss(animated: true )
               showInfoTopAlert(withMessage: "Your card Successfully Added".localize)
             
           }
           print("Finished loading")
       }
       
       // Called if an error occurs during the loading process
       func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
           print("Failed to load with error: \(error.localizedDescription)")
       }
       
       // Called if an error occurs when the content is about to load
       func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
           print("Failed to load the initial content with error: \(error.localizedDescription)")
       }
    
    
    

}
