//
//  Enums.swift
//  ShipToEX
//
//  Created by AAIT Company on 27/06/2022.
//

import Foundation
enum StoryBoard: String {
    case Main
    case Home

}

enum SuccessfullyViewPopupMessage: String {
    case successReview = "Congratulations! Your review has been submitted successfully."
    case cancelOrderSuccess = "Congratulations! Your order canceled successfully."
    case senfOfferSuccess = "Congratulations! Your offer has been submitted successfully"
    case withdrawSuccess = "Congratulations! Your are withdraw from order successfully"
    case CreateCopmlaintSuccess = "Your complaint has been sent successfully"
    case rejectOrderSuccess = "Reason for rejection has been sent successfully."
    case deleteAddressSuccessfully = "Congratulations!\n address deleted successfully."
    case complaintSendSueccss = ""
}

enum orderState: String {
    case open
    case inprogress
    case finished
}

enum appLanguage: String {
    case english = "en"
    case arabic = "ar"
}

enum AccountType: String {
    case user = "user"
    case provider = "factory"
    case delegate = "delegate"
    case unknown
}

enum userGender: String {
    case man = "man"
    case women = "women"
}

enum HomeData: String {
    case ads
    case categories
}

enum ResponceStatus: String {
    case success
    case fail
    case tokenFail
    case needActive
}

enum UserState: String {
    case active
    case pending
    case block
}
