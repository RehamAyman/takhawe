//
//  cardModel.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import SwiftUI


struct CardModel: Identifiable {
    
    var id = UUID().uuidString
    
    var colors: [Color]
    
    static let cards: [CardModel] = [
        CardModel(colors: [Color(Colors.main), Color(Colors.main).opacity(0.4)]),
        CardModel(colors: [Color(Colors.lightIndigo), Color(Colors.lightBlue)]),
        CardModel(colors: [Color(Colors.lightGreen), Color(Colors.lightBlue)]),
        CardModel(colors: [Color(Colors.lightIPeach), Color(Colors.lightBlue)])
    ]
}
struct Colors {
    static let lightBlue = "lightBlue"
    static let lightGreen = "lightGreen"
    static let lightIndigo = "lightIndigo"
    static let lightIPeach = "lightIPeach"
    static let lightIPink = "lightIPink"
    static let main = "MainColor"
}
struct OnboardingModel: Identifiable , Hashable {
    
    var id : Int
    
    var colors: [Color]
    
    static let cards : [OnboardingModel] = [
        OnboardingModel(id: 0, colors: [Color(Colors.main), Color(Colors.main).opacity(0.4)]),
        OnboardingModel(id: 1, colors: [Color(Colors.lightIndigo), Color(Colors.lightBlue)]) ,
        OnboardingModel(id: 2, colors: [Color(Colors.lightIndigo), Color(Colors.lightBlue)]) ,
        OnboardingModel(id: 3, colors: [Color(Colors.lightIndigo), Color(Colors.lightBlue)]) 
       
    ]
}
