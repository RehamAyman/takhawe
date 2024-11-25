//
//  billingPdf.swift
//  Takhawi
//
//  Created by Reham Ayman on 23/05/1446 AH.
//

import UIKit
import WebKit




class billingWebView : UIViewController, WKNavigationDelegate {
    
    var action: (() -> Void)?
    
    
    var webView: WKWebView!
    var tripId : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        var stringUrl = "pdf-report/driver/\(self.tripId)"
        if UserDefaults.user?.user?.role ==  role.driver.rawValue {
            stringUrl = "pdf-report/driver/\(self.tripId)"
        } else {
            stringUrl = "pdf-report/user/\(self.tripId)"
        }
        if let url = URL(string: Server.baseURL.rawValue + stringUrl) {
            var request = URLRequest(url: url)
            request.setValue( UserDefaults.accessToken ?? "" , forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
            request.method = .get
            webView.load(request)
        }
    }
    
    
    // WKNavigationDelegate methods to get callbacks
       
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
          
           guard let url = webView.url?.absoluteString else { return }
           print("🌏🌏🌏🌏🌏")
           
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
