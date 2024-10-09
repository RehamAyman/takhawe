//
//  ApplePayHandler.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/04/1446 AH.
//

import Foundation
import PassKit



typealias PaymentCompletionHandler = (Bool) -> Void
  

class PaymentHandler: NSObject {

static let supportedNetworks: [PKPaymentNetwork] = [
    
    .masterCard,
    .visa ,
    .mada
    
]

var paymentController: PKPaymentAuthorizationController?
var paymentSummaryItems = [PKPaymentSummaryItem]()
var paymentStatus = PKPaymentAuthorizationStatus.failure
var completionHandler: PaymentCompletionHandler?
    var ammount : String = ""
    var paitentId : String = ""
    var doctorId : String = ""
    var time : String = ""
    var date : String = ""
    var duration : Int = 30
    
    
    func startPayment(  total : String  , VAT : String , serviceCost : String  ,    completion: @escaping PaymentCompletionHandler) {
        self.ammount = total
        
       
        
    let amount = PKPaymentSummaryItem(label: "Amount", amount: NSDecimalNumber(string: serviceCost), type: .final)
    let tax = PKPaymentSummaryItem(label: "VAT", amount: NSDecimalNumber(string: VAT), type: .final)
        let total = PKPaymentSummaryItem(label: "Takhawe".localized, amount: NSDecimalNumber(string: total), type: .final)

    paymentSummaryItems = [amount, tax, total];
    completionHandler = completion
       
    // Create our payment request
    let paymentRequest = PKPaymentRequest()
    paymentRequest.paymentSummaryItems = paymentSummaryItems
    paymentRequest.merchantIdentifier = "merchant.merchentTakhawe"
        paymentRequest.merchantCapabilities = .capability3DS
    paymentRequest.countryCode = "SA"
    paymentRequest.currencyCode = "SAR"
   // paymentRequest.requiredShippingContactFields = [.phoneNumber, .emailAddress]
    paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks

    // Display our payment request
    paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
    paymentController?.delegate = self
    paymentController?.present(completion: { (presented: Bool) in
        if presented {
            NSLog("Presented payment controller")
        } else {
            NSLog("Failed to present payment controller")
            self.completionHandler!(false)
         }
     })
  }
}

/*
    PKPaymentAuthorizationControllerDelegate conformance.
*/
extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {

    func paymentAuthorizationController( _ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {

    // Perform some very basic validation on the provided contact information
    
    print("🍏hello here apple pay id response :  \(payment.token.transactionIdentifier)")
        print(payment.token.paymentMethod.network?.rawValue)
        print(payment)
       
   
        
        
        
        // server connection func

    
        do {
            // we decode your data without using any encoding type
            let val = try JSONDecoder().decode(appleModel.self, from: payment.token.paymentData)
            print("apple response with the following : \(val)")
            print(val)
            
            
            
            
            completion( .success)
            self.paymentStatus = .success
           //  11 params
// check on my server first // if success or not
            
            


//            self.verfiyApplePay(
//                                amount: self.ammount ,
//                                transactionIdentifier: payment.token.transactionIdentifier,
//                                data: val.data ,
//                                publickey: val.header.publicKeyHash,
//                                ephemralPublicKey: val.header.ephemeralPublicKey,
//                                version: val.version,
//                                signature: val.signature,
//                                displayName: payment.token.paymentMethod.displayName ?? "",
//                                network: payment.token.paymentMethod.network?.rawValue ?? "" ,
//                                type: String(payment.token.paymentMethod.type.rawValue )   ,
//                                transtion: val.header.transactionId ,
            
            
            
            
//                                patientId: self.paitentId ,
//                                doctorId:  self.doctorId ,
//                                date: self.date ,
//                                time: self.time ,
//                                duration: self.duration
//            ) { result, success in
//                if success {
//                    if result?.result == true {
//                        completion( .success)
//                        self.paymentStatus = .success
//                        // new end poient
//
//
//                        // show success message or back or refresh
//
//
//                    } else {
//                        completion( .failure)
//                        self.paymentStatus = .failure
//                    }
//                }else {
//                        completion( .failure)
//                    self.paymentStatus = .failure
//                }
//
//
//            }

        } catch {
            // should not get any error, but just in case.
            print("Error: \(error)")
            completion( .failure)
            paymentStatus = .failure
        }

        // server response
   
      
}

func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
    controller.dismiss {
        DispatchQueue.main.async {
            if self.paymentStatus == .success {
                self.completionHandler!(true)
            } else {
                self.completionHandler!(false)
            }
        }
    }
}
    
    
//    func verfiyApplePay   ( amount : String , transactionIdentifier : String , data : String , publickey : String , ephemralPublicKey : String , version : String , signature : String , displayName : String , network : String , type : String , transtion : String   , patientId : String , doctorId : String , date : String  , time : String  , duration : Int , completion: @escaping( _ result : ApplePayModelData? ,  _ success : Bool ) -> Void) {
//        
//            NetworkService.shared.verifyApplePay(amount: amount, transaction_identifier: transactionIdentifier , data: data, publicKeyHash: publickey, ephemeralPublicKey: ephemralPublicKey, version: version, signature: signature, displayName: displayName, network: network, type: type, transactionId: transtion , patientId: patientId , doctorId: doctorId , date: date  , time: time  , duration: duration ) { result  in
//                switch result {
//                case .success(let order):
//                   completion(order , true)
//                    print("pay end poient response .... 🍏🍏🍏🍏")
//                    print(order)
//                case .failure(let error):
//                    completion( nil  , true)
//                    print(" ⭕️⭕️ pay end poient error response ....  ⭕️⭕️")
//                    print(error)
//                }
//            }
//    }
    
    
}




struct appleModel : Codable {
    let version : String
    let data : String
    let signature : String
    let header : headerObject
    
}


struct headerObject : Codable   {
    let ephemeralPublicKey : String
    let  publicKeyHash : String
    let transactionId : String
    
    
}
