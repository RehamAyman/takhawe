//
//  APIRouter.swift
//
//  Created by AAIT
//

import Alamofire
import Foundation

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: ServerPath {get}
    var parameters: APIParameters? {get}
    var insideUrlParam: [String]? {get}
    func send<T: Codable> (data: [UploadData]?, completion: @escaping (_ respons: T) -> Void)
}

extension APIRouter {

    private var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    // MARK: - Create Request -
    func asURLRequest() throws -> URLRequest {

        // MARK: - URL -

        var mainURL = try Server.baseURL.rawValue.asURL().appendingPathComponent(path.value)

        if insideUrlParam != nil {
            for param in insideUrlParam! {
                mainURL =  mainURL.appendingPathComponent(param)
                let EncodeingUrl = "\(mainURL)".replacingOccurrences(of: "/%3F", with: "?")
                print("🥰🥰🥰\(mainURL)")
                mainURL = URL(string: EncodeingUrl)!
            }
        }

        var urlRequest = URLRequest(url: mainURL)

        // MARK: - HTTTP Method -
        urlRequest.httpMethod = method.rawValue

        // MARK: - Common Headers -
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(Language.apiLanguage(), forHTTPHeaderField: HTTPHeaderField.lang.rawValue)

        // MARK: - Token -
        if  let token = defult.shared.user()?.token, !token.trimWhiteSpace().isEmpty {

            urlRequest.setValue( ContentType.tokenBearer.rawValue + token, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        }
//        let token = "11|JYQWgcxj2qFwxGD6c128eQXFTeoS7M5gNWhiyJBR"

//        urlRequest.setValue( ContentType.tokenBearer.rawValue + token, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)

        // MARK: - Parameters -
        if let parameters = parameters?.compactMapValues({$0}) {
            urlRequest = try encoding.encode(urlRequest, with: parameters)
        }

        // MARK: - All Request data
        print("\n\n====================================\n🚀🚀FULL REQUEST COMPONENETS::: \n\n URL:: \(urlRequest.url?.absoluteString ?? "No URL Found") \n---------------------------------\n Method:: \(urlRequest.httpMethod ?? "No httpMethod") \n---------------------------------\n Header:: \n\((urlRequest.allHTTPHeaderFields ?? [:]).json()) \n---------------------------------\n Parameters:: \n\((parameters ?? [:]).json()) \n\n====================================\n\n")

        return urlRequest
    }

    // MARK: - Send Request -
    func send<T: Codable> (data: [UploadData]? = nil, completion: @escaping (_ response: T) -> Void) {

        if let data = data {

            self.uploadToServerWith(data: data) { (respons: T?, errorType) in
                AppIndicator.shared.dismiss()
                if let respons = respons {
                    completion(respons)
                } else if let errorType = errorType {
                    switch errorType {
                    case .connectionError:
                        AppAlert.showInternetConnectionErrorAlert {
                            AppIndicator.shared.show(isGif: false)
                            self.send(data: data, completion: completion)
                        }
                    case .canNotDecodeData:
                        AppAlert.showSomethingError()
                    }
                }
            }
            return
        }
        AF.request(self).responseData { data in
            printApiResponse(data.data)
            self.handleResponse(data) { (respons: T?, errorType) in
                AppIndicator.shared.dismiss()
                if let respons = respons {
                    completion(respons)
                } else if let errorType = errorType {
                    switch errorType {
                    case .connectionError:
                        AppAlert.showInternetConnectionErrorAlert {
                            AppIndicator.shared.show(isGif: false)
                            self.send(data: nil, completion: completion)
                        }
                    case .canNotDecodeData:
                        AppAlert.showSomethingError()
                    }
                }
            }
        }

    }

    private func uploadToServerWith<T: Codable> (data: [UploadData], completion: @escaping (_ response: T?, _ errorType: APIErrors?) -> Void) {
        AF.upload(multipartFormData: { multipartFormData in
            if let parameters = self.parameters?.compactMapValues({$0}) {
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }
            }
            for item in data {
                multipartFormData.append(item.data, withName: item.name, fileName: item.fileName, mimeType: item.mimeType.rawValue)
            }

        }, with: self).uploadProgress(closure: { (progress) in
            print("the Progress is \(progress)")
        }).responseData { data in
            printApiResponse(data.data)
            self.handleResponse(data, completion: completion)
        }
    }

    private func handleResponse<T: Codable>(_ response: AFDataResponse<Data>, completion: @escaping (_ respons: T?, _ errorType: APIErrors?) -> Void) {
        switch response.result {
        case .failure:
            completion(nil, .connectionError)
        case .success(let value):
            do {
                let decoder = JSONDecoder()
                let valueObject  = try decoder.decode(T.self, from: value)

                if let value = valueObject as? APIGloabelResponse {
//                    if value.userStatus == "block" {
//                        completion(nil ,nil)
//                        UserDefaults.user = nil
//                        UserDefaults.accessToken = nil
////                        UserDefaults.isLogin = false
//                        UserDefaults.userLat = ""
//                        UserDefaults.userLong = ""
//                        guard let vc = AppStoryboards.Main.initialVC() else { return }
//                        AppHelper.changeWindowRoot(vc: vc)
//                        AppAlert.showErrorAlert(error: "You have been blocked from management".localized)
//                    } else if value.message == "Unauthenticated." {
//                        completion(nil ,nil)
//                        UserDefaults.user = nil
//                        UserDefaults.accessToken = nil
////                        UserDefaults.isLogin = false
//                        UserDefaults.userLat = ""
//                        UserDefaults.userLong = ""
//                        guard let vc = AppStoryboards.Main.initialVC() else { return }
//                        AppHelper.changeWindowRoot(vc: vc)
//                        AppAlert.showErrorAlert(error: "Something went wrong... You must log in".localized)
//                    } else {
                        switch value.key {
                        case .success, .needActive:
                            completion(valueObject, nil)
                        case .fail, .exception:
                            completion(nil, nil)
                            AppAlert.showErrorAlert(error: value.message)

                        case .unauthenticated, .blocked:
                            AppAlert.showunaUthenticatedError(msg: "Please log First".localized)

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

//                                SocketConnection.sharedInstance.socket.off("sendMessage")
//                                SocketConnection.sharedInstance.socket.disconnect()
//
                                UserDefaults.standard.removeObject(forKey: "token")
                                UserDefaults.user = nil
                                UserDefaults.accessToken = nil
                                UserDefaults.isLogin = false

//                                let vc = AppStoryboards.Main.viewController(LoginViewController.self)
//                                let nav = CustomNavigationController(rootViewController: vc)
//                                AppHelper.changeWindowRoot(vc: nav)
                            }

                        }

                }
            } catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
                print(context.codingPath)
                completion(nil, .canNotDecodeData)
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
                print(context.codingPath)
                completion(nil, .canNotDecodeData)
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
                print(context.codingPath)
                completion(nil, .canNotDecodeData)
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
                print(context.codingPath)
                completion(nil, .canNotDecodeData)
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
                completion(nil, .canNotDecodeData)
            }
        }
    }

    // MARK: - Helper Methods -
    private func printApiResponse(_ responseData: Data?) {
        guard let responseData = responseData else {
            print("\n\n====================================\n⚡️⚡️RESPONSE IS::\n", responseData as Any, "\n====================================\n\n")
            return
        }

        if let object = try? JSONSerialization.jsonObject(with: responseData, options: []),
           let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys]), let JSONString = String(data: data, encoding: String.Encoding.utf8) {
            print("\n\n====================================\n⚡️⚡️RESPONSE IS::\n", JSONString, "\n====================================\n\n")
            return
        }
        print("\n\n====================================\n⚡️⚡️RESPONSE IS::\n", responseData, "\n====================================\n\n")
    }

}
