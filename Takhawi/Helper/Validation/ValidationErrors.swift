//
//  ValidationError.swift
//  Helper
//
//  Created by Mohammed Abouarab on 02/12/2021.
//

import Foundation

enum ValidationError: Error {
    // MARK: - Name -

    case emptyFirstName
    case shortFirstName
    case longFirstName
    case emptyLastName
    case shortLastName
    case longLastName
    case emptyproviderName
    case shortproviderName
    case longproviderName
    case emptyFullName
    case shortFullName
    case longFullName
    case emptyName
    case shortName
    case longName
    case emptyGender
    case emptyNationality

    // MARK: - Phone -

    case emptyPhoneNumber
    case incorrectPhoneNumber
    case incorrectAccountNumber

    // MARK: - Verification Code -

    case emptyVerificationCode
    case incorrectVerificationCode

    // MARK: - Email -

    case emptyMail
    case wrongMail

    // MARK: - Passwords -

    case emptyPassword
    case shortPassword
    case shortPasswordConfirmation
    case emptyNewPassword
    case shortNewPassword
    case emptyOldPassword
    case shortOldPassword
    case emptyConfirmNewPassword
    case emptyConfirmPassword
    case notMatchPasswords

    // MARK: - Locations -

    case emptyCountry
    case emptyGovernorate
    case emptyCity
    case emptyArea
    case emptyStreet
    case addressType
    case emptyLocation
    case Titleofthemessage

    // MARK: - Images -

    case coverPicture
    case profilePicture
    case licensePicture

    // MARK: - carPalet -

    case carPicture
    case carPlate
    case carModel
    case carType

    // MARK: - Date -

    case emptyAge
    case youngAge
    case emptyDate
    case notOldDate
    case notNewDate
    case emptyMessage

    // MARK: - CreateOrder

    case emptyProducts
    case emptyPaymenWay
    case emptyDeliveryLocation
    case emptyReciveLocation
    case emptyDeliveryTime
    case emptyOrderDetails
    case shortOrderDetails
    case emptyComplainteDetails
    case shortComplainteDetails
    case emptyComment
    case shortComment
    case rateIsEmpty
    case emptyComplpainteReasone
    case emptyCopoun
    case emptyDeliveryDate
    case storeName
    case projectTitle
    case projectCategory
    case emptyPriceFrom
    case emptyPriceTo
    case expictedDurationempty
    case projectDetilsempty
    case priceRange
    case emptyReportTitle
    case emptyReportMessage

    // MARK: - Delegate

    case emptyProductPrice
    case emptyDeliveryPrice

    // MARK: - DelegateOrderState

    case delegatePaymentStateForUser

    // MARK: - Product

    case emptyProductNameAr
    case emptyProductNameEn
    case emptyProductPriceDiscount
    case emptyMenu
    case emptyProductDescriptionAr
    case emptyProductDescriptionEn
    case emptyProductType
    case emptyNameAr
    case emptyNameEn
    case category
    case banckAcrounNum
    case ibanNum
    case emptyCommirtialID
    case emptyBankName
    case emptyStockType
    case emptyQuanty
    case notValidateDate
    case notValidateDiscount
    case emptyPreperity
    case detilsOfMessage

    case emptynameOfAccountHolder
    case emptybankName
    case emptyaccountNumber
    // MARK: - Provider
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        // MARK: - Name -
        case .emptyReportTitle:
            return "Enter Report title".localized
        case .incorrectAccountNumber:
            return "The bank account number must be between 14 To 24 number".localized
        case .emptyReportMessage:

            return "Enter Report details".localized

        case .priceRange:
            return "The minimum price must be less than the maximum price".localized
        case .projectDetilsempty:
            return "Enter project details".localized
        case .expictedDurationempty:
            return "Select the expected duration of the project in days".localized
        case .emptyPriceTo:
            return "Select the maximum price".localized
        case .emptyPriceFrom:
            return "Choose the minimum price".localized
        case .projectTitle:
            return "Enter a project title".localized
        case .projectCategory:
            return "Choose a project category".localized
        case .emptyaccountNumber:
            return "Please enter Account Number.".localized
        case .emptybankName:
            return "Please enter Bank Name.".localized
        case .emptynameOfAccountHolder:
            return "Please enter Name of Account Holder.".localized

        case .Titleofthemessage:
            return "Please enter Message Title.".localized
        case .detilsOfMessage:
            return "Please enter message details.".localized
        case .storeName:
            return "Please enter Store Name.".localized
        case .emptyFirstName:
            return "Please enter first name.".localized
        case .shortFirstName:
            return "First name is too short.".localized
        case .longFirstName:
            return "First name is too long.".localized
        case .emptyLastName:
            return "Please enter last name.".localized
        case .shortLastName:
            return "Last name is too short.".localized
        case .longLastName:
            return "Last name is too long.".localized
        case .emptyproviderName:
            return "Please enter provider name.".localized
        case .shortproviderName:
            return "provider name is too short.".localized
        case .longproviderName:
            return "provider name is too long.".localized
        case .emptyFullName:
            return "Please enter full name.".localized
        case .shortFullName:
            return "Full name is too short.".localized
        case .longFullName:
            return "Full name is too long.".localized
        case .emptyName:
            return "Please enter name.".localized
        case .shortName:
            return "Name is too short.".localized
        case .longName:
            return "Name is too long.".localized
        case .emptyGender:
            return "Please select gender".localized
        case .emptyNationality:
            return "Please select nationality".localized

        // MARK: - Phone -

        case .emptyPhoneNumber:
            return "Please enter your phone number.".localized
        case .incorrectPhoneNumber:
            return "Please enter correct phone number.".localized

        // MARK: - Verification Code -

        case .emptyVerificationCode:
            return "Please enter verification code field.".localized
        case .incorrectVerificationCode:
            return "Verification Code should be 4 digits.".localized

        // MARK: - Email -

        case .emptyMail:
            return "Please enter email field.".localized
        case .wrongMail:
            return "Please enter correct email address.".localized
        case .emptyMessage:
            return "Please write your message.".localized

        // MARK: - Passwords -

        case .emptyPassword:
            return "Please enter password field.".localized
        case .shortPassword:
            return "Password is too short, it should be 8 characters at least.".localized
        case .shortPasswordConfirmation:
            return "Password Confirmation is too short, it should be 8 characters at least.".localized
        case .emptyNewPassword:
            return "Please enter new password field.".localized
        case .shortNewPassword:
            return "New password is too short, it should be 6 characters at least.".localized
        case .emptyOldPassword:
            return "Please enter old password field.".localized
        case .shortOldPassword:
            return "Old password is too short, it should be 6 characters at least.".localized
        case .emptyConfirmNewPassword:
            return "Please enter confirm new password field.".localized
        case .emptyConfirmPassword:
            return "Please enter confirm password field.".localized
        case .notMatchPasswords:
            return "Passwords not match.".localized

        // MARK: - Locations -

        case .emptyCountry:
            return "Please select country.".localized
        case .emptyGovernorate:
            return "Please select governorate".localized
        case .emptyCity:
            return "Please select city.".localized
        case .emptyArea:
            return "Please select region.".localized
        case .emptyStreet:
            return "Please enter street name.".localized
        case .addressType:
            return "Please enter address type.".localized
        case .emptyLocation:
            return "Please select the location.".localized

        // MARK: - Images -

        case .coverPicture:
            return "Please pick cover picture.".localized
        case .profilePicture:
            return "Please pick your profile picture.".localized
        case .licensePicture:
            return "Please pick license picture.".localized

        // MARK: - Cars -

        case .carPicture:
            return "Please pick car picture".localized
        case .carPlate:
            return "Please enter car palet.".localized
        case .carModel:
            return "Please select car model.".localized
        case .carType:
            return "Please Select car type.".localized

        // MARK: - Date -

        case .emptyProducts:
            return "Products must be selected first.".localized
        case .emptyAge:
            return "Please enter the age.".localized
        case .youngAge:
            return "If it is your age, please grow up first =D.".localized
        case .notOldDate:
            return "Please selecte older date.".localized
        case .notNewDate:
            return "Please selecte newer date.".localized
        case .emptyDate:
            return "Please select the date.".localized

        // MARK: - CreateOrder

        case .emptyPaymenWay:
            return "Please select payment way first".localized
        case .emptyDeliveryLocation:
            return "Please select delivery location first".localized
        case .emptyReciveLocation:
            return "Please select receive location first".localized
        case .emptyDeliveryTime:
            return "Please select delivery time first".localized
        case .emptyDeliveryDate:
            return "Please select delivery date first".localized
        case .emptyOrderDetails:
            return "Please enter order details".localized
        case .shortOrderDetails:
            return "Order details is too short.".localized
        case .emptyComment:
            return "Please enter your Comment".localized
        case .shortComment:
            return "Commint is too short.".localized
        case .rateIsEmpty:
            return "Please select rate first".localized
        case .emptyComplainteDetails:
            return "Please enter complaint details".localized
        case .shortComplainteDetails:
            return "Complaint details is too short.".localized
        case .emptyComplpainteReasone:
            return "Please select complaint reasone".localized
        case .emptyCopoun:
            return "Please enter coupon first".localized

        // MARK: - DelegateOrderState

        case .delegatePaymentStateForUser:
            return "The customer has not paid yet".localized
        case .emptyProductPrice:
            return "Please enter the cost of the order".localized
        case .emptyDeliveryPrice:
            return "Please enter the cost of the delivery".localized

        // MARK: - Product

        case .emptyProductNameAr:
            return "Please enter the product name in Arabic".localized
        case .emptyProductNameEn:
            return "Please enter the product name in English".localized
        case .emptyProductPriceDiscount:
            return "Please enter product price after discount".localized
        case .emptyProductDescriptionAr:
            return "Please enter product description in Arabic".localized
        case .emptyProductDescriptionEn:
            return "Please enter product description in English".localized
        case .emptyProductType:
            return "Please select product type".localized
        case .emptyMenu:
            return "Please select menu".localized
        case .emptyNameAr:
            return "Please enter the name in Arabic".localized
        case .emptyNameEn:
            return "Please enter the name in English".localized
        case .category:
            return "Please select category".localized
        case .banckAcrounNum:
            return "Please enter bank account number".localized
        case .ibanNum:
            return "Please enter bank iban number".localized
        case .notValidateDate:
            return "The start date must be before the end date".localized
        case .emptyCommirtialID:
            return "Please enter your commercial id".localized
        case .emptyBankName:
            return "Please enter bank name".localized

        case .emptyStockType:
            return "Please select stock type".localized
        case .emptyQuanty:
            return "Please enter stock quantity".localized

        case .notValidateDiscount:
            return "The value after discount is incorrect".localized

        case .emptyPreperity:
            return "Make sure all data is entered in a group num".localized
        }
    }
}
