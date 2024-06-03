//
//  UserDefaultsExtensions.swift
//  Takhawi
//
//  Created by Sara Mady on 12/07/2023.
//

import Foundation

import UIKit

@propertyWrapper
struct ValueDefault<Value> {

    let key: String
    let defualtValue: Value
    let container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            return container.value(forKey: key) as? Value ?? defualtValue
        }
        set {
            container.setValue(newValue, forKey: key)
        }
    }
}

@propertyWrapper
struct ModelsDefault<Model: Codable> {

    let key: String
    let defualtValue: Model
    let container: UserDefaults = .standard

    var wrappedValue: Model {
        get {
            let decoder = JSONDecoder()
            guard let decoded = container.object(forKey: key) as? Data else {return defualtValue}
            let loadedValue = try? decoder.decode(Model.self, from: decoded)
            return loadedValue ?? defualtValue
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                container.set(encoded, forKey: key)
                container.synchronize()
            }
        }
    }
}

extension UserDefaults {

    private enum Keys: String {
        case themeStyle
        case googleMapKey
        case accessToken
        case pushNotificationToken
        case isFirstTime
        case isLogin
        case notificationCount
        case user
        case userCountry
        case userLat
        case userLong
        case userType
    }

    @ModelsDefault(key: Keys.themeStyle.rawValue, defualtValue: .systemStyle)
    static var themeStyle: Themes.Style

    @ModelsDefault(key: Keys.user.rawValue, defualtValue: nil)
    static var user: LoginModelData?

//    @ModelsDefault(key: Keys.userCountry.rawValue, defualtValue: nil)
//    static var userCountry: Country?
//
    @ValueDefault(key: Keys.googleMapKey.rawValue, defualtValue: String())
    static var googleMapKey: String

    @ValueDefault(key: Keys.isLogin.rawValue, defualtValue: false)
    static var isLogin: Bool {
        didSet {
            NotificationCenter.default.post(name: .isLoginChanged, object: nil)
        }
    }

    @ModelsDefault(key: Keys.accessToken.rawValue, defualtValue: nil)
    static var accessToken: String?

    @ValueDefault(key: Keys.pushNotificationToken.rawValue, defualtValue: nil)
    static var pushNotificationToken: String?

    @ValueDefault(key: Keys.userType.rawValue, defualtValue: nil)
    static var userType: String?

    @ValueDefault(key: Keys.isFirstTime.rawValue, defualtValue: true)
    static var isFirstTime: Bool

    @ValueDefault(key: Keys.notificationCount.rawValue, defualtValue: 0)
    static var notificationCount: Int

    @ValueDefault(key: Keys.userLat.rawValue, defualtValue: String())
    static var userLat: String

    @ValueDefault(key: Keys.userLong.rawValue, defualtValue: String())
    static var userLong: String

}
