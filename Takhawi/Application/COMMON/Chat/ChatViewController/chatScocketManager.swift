//
//  chatScocketManager.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/03/1446 AH.
//

import UIKit
import SocketIO




open class ChatSocketConnection {
    
    //MARK: - Types -
    enum UserType: String {
        case client = "User"
        case provider = "Provider"
    }
    enum SocketConnectionType: String {
        case chat = "chat"
        case track = "track"
    }
    
    
    
    enum MessageTypeValue: String {
        case text = "TEXT"
        case image
        case file
        case video
        case sound
        case map

    }
    
    enum MessageType {
        
        case text(value: String)
        case image(path: String)
        case file(path: String, fileName: String)
        case video(path: String, duration: String, thumbnail: String)
        case sound(path: String, duration: String)
        case map(latitude: Double, longitude: Double)
        
        var socketValue: MessageTypeValue {
            switch self {
            case .text:
                return .text
            case .image:
                return .image
            case .file:
                return .file
            case .video:
                return .video
            case .sound:
                return .sound
            case .map:
                return .map
            }
        }
        
        var socketParameters: [String: String] {
            
            var data = [String: String]()
            
            data[DataSocketKeys.messageType] = self.socketValue.rawValue
            
            switch self {
            case .text(let value):
                data[DataSocketKeys.message] = value
            case .image(let path):
                data[DataSocketKeys.message] = path
            case .file(let path, let fileName):
                data[DataSocketKeys.message] = path
                data[DataSocketKeys.fileName] = fileName
            case .video(let path, let duration, let thumbnail):
                data[DataSocketKeys.message] = path
                data[DataSocketKeys.duration] = duration
                data[DataSocketKeys.thumbnail] = thumbnail
            case .sound(let path, let duration):
                data[DataSocketKeys.message] = path
                data[DataSocketKeys.duration] = duration
            case .map(let latitude, let longitude):
                data[DataSocketKeys.latitude] = "\(latitude)"
                data[DataSocketKeys.longitude] = "\(longitude)"
            }
            
            return data
            
        }
        
        var messageBodyValue: String {
            switch self {
            case .text(let value):
                return value
            case .image(let path):
                return path
            case .file(let path, _):
                return path
            case .video(let path, _, _):
                return path
            case .sound(let path, _):
                return path
            case .map(let latitude, let longitude):
                return ""
            }
        }
    }
    
    struct Message {
        let id: String
        let roomId: String
        let avatar: String
        let senderId: Int
        let receiverId: String
        let type: MessageType
        let isSender: Bool
        let createdAt: String
        let lat,lng:Double
        
        
    }
    
    struct SenderData {
        let type: UserType
        let id: String
        let senderName: String
        let avatar: String
    }
    
    struct ReceiverData {
        let id: String
        let type: UserType
    }
//    {
//        "chatId": "f4f472e7-8f7a-4562-a6d4-cee9ac394668",
//        "content": "Hello",
//        "contentType": "TEXT" // OPTIONAL NOTE: Only Text Supported For Now
//    }

    //
    
    //MARK: - Constants -
    private enum EmitTypes: String {
        case enterChat = "join chat"
        case exitChat = "leave chat"
        case sendMessage = "message"
        case updateLocation = "updatelocation"
        case addtracker = "addtracker"
    }
    private enum ReceiveTypes {
        static let sendMessageRes = "message"
        static let trackorder = "trackorder"
    }
    private enum DataSocketKeys {
        static let conversationId = "chatId"
        static let receiverId = "receiver_id"
        static let receiverType = "receiver_type"
        static let messageType = "contentType"
        static let message = "content"
        static let duration = "duration"
        static let fileName = "name"
        static let thumbnail = "thumbnail"
        static let latitude = "lat"
        static let longitude = "lng"
        static let providerId = "provider_id"

    }
    private enum SocketConnectKeys {
        static let senderType = "sender_type"
        static let senderId = "sender_id"
        static let senderName = "sender_name"
        static let avatar = "avatar"
        static let providerId = "provider_id"
        static let lat = "lat"
        static let lng = "lng"
        static let mapDesc = "map_desc"
    }
    
    //MARK: - Properties -
    private let socket: SocketIOClient
    private let url = Server.imageBase.rawValue
    private var conversationId: String
    private let sender: SenderData
    private let ConnectionType: SocketConnectionType
    private let receiver: ReceiverData
    private let manager: SocketManager
    var connectParams: [String: String] = [:]
    
    var onMessageReceived: ((Message)->())? {
        didSet {
            socket.off(ReceiveTypes.sendMessageRes)
            socket.on(ReceiveTypes.sendMessageRes) { [weak self] (value, ack) in
                guard let self = self else {return}
                guard let dict = value[0] as? [String: Any] else{
                    log("can not decode the new Message as [String:Any]", "value is: \(value)")
                    return
                }
                log("🚦New Socket Message🚦", "\(dict)")
                self.onMessageReceived?(self.createMessage(from: dict))
            }
        }
    }
    
    
    
    var onNewLocationReceived: ((Message)->())? {
//
//        object Tracking {
//        const val LAT = "lat"
//        const val LNG = "lng"
//        const val MAP_DESC = "map_desc"
//        const val UPDATE_LOCATION = "updatelocation"
        
//        const val TRACKER_ID = "tracker_id"
//        const val USER_ID = "user_id"
//        const val ADD_TRACKER = "addtracker"
//        const val TRACK_ORDER = "trackorder"
//        const val PROVIDER_ID = "provider_id"
//        }
        
        didSet {
            socket.off(ReceiveTypes.trackorder)
            socket.on(ReceiveTypes.trackorder) { [weak self] (value, ack) in
                guard let self = self else {return}
              
                
                guard let dict = value[0] as? [String: Any] else{
                    log("can not decode the new Location as [String:Any]", "value is: \(value)")
                    return
                }
                log("🚦New Socket Location Updated🚦", "\(value)")
                self.onNewLocationReceived?(self.createMessage(from: dict))
            }
        }
    }
    
    var onConnectionStatus: ((SocketClientEvent)->())?
    
    //MARK: - Init -
   
    
    init(
        ConnectionType:SocketConnectionType,
        conversationId: String?,
        sender: SenderData,
        receiver: ReceiverData
    ) {
        self.ConnectionType = ConnectionType
        self.conversationId = conversationId ?? "0"
        self.sender = sender
        self.receiver = receiver
        
        if ConnectionType == .chat {
            self.connectParams = [
                SocketConnectKeys.senderType: sender.type.rawValue,
                SocketConnectKeys.senderId: sender.id,
                SocketConnectKeys.senderName: sender.senderName,
                SocketConnectKeys.avatar: sender.avatar
            ]
        }else{
            
            self.connectParams = [
                SocketConnectKeys.providerId: receiver.id,
                SocketConnectKeys.senderType: sender.type.rawValue,
                SocketConnectKeys.senderId: sender.id,
                SocketConnectKeys.senderName: sender.senderName,
                SocketConnectKeys.avatar: sender.avatar
            ]
            
          
        }
        print("🚗\(self.conversationId)")
        print("💹\(self.ConnectionType)")
        print("⚠️\(self.connectParams)")
        manager = SocketManager(
            socketURL: URL(string: url)!,
            config: [
                .log(true),
                .connectParams(connectParams) ,
                .reconnects(true),        // Automatically try to reconnect
                .reconnectWait(5) ,
                .extraHeaders(["authorization": UserDefaults.accessToken ?? ""
                                , "Accept-Language": LocalizationManager.shared.getLanguage() == .Arabic ? "ar" : "en" ])
            ]
        )
        socket = manager.defaultSocket
        self.handleEvents()
        
    }
    
    //MARK: - Private -
    private func handleEvents() {
        self.socket.on(clientEvent: .error) { [weak self] (data, ack) in
            guard let self = self else { return }
            log("Error", "\(data)")
            self.checkCurrentStatus()
        }
        self.socket.on(clientEvent: .disconnect) { [weak self] (data, ack) in
            guard let self = self else { return }
            self.checkCurrentStatus()
        }
        self.socket.on(clientEvent: .ping) { [weak self] (data, ack) in
            guard let _ = self else { return }
            self?.log("Ping")
        }
        self.socket.on(clientEvent: .reconnect) { [weak self] (data, ack) in
            guard let self = self else { return }
            self.checkCurrentStatus()
        }
    }
    private func emit(for type: EmitTypes, data: [String: Any], completion: (() -> ())?) {
        self.log("Emitting to type: \(type.rawValue)", data.json())
        socket.emit(
            type.rawValue,
            with: [data],
            completion: completion
        )
    }
    private func createMessage(from dictionary: [String: Any]) -> Message {
        
        /// `Type`
        ///
       
        var type: MessageTypeValue = .text
        if let stringType = dictionary["contentType"] as? String {
            if let messageTypeValue = MessageTypeValue(rawValue: stringType) {
                type = messageTypeValue
            } else {
                log("Received message has a key `type` with a value \(stringType) which is not available in our `MessageTypeValue` enum , we set the type of the message to `text` as a default.")
            }
        } else {
            log("Received message has no value associated with the key `type`, we set the type of the message to `text` as a default.")
        }
        
        
        /// `Body`
        var body: String = " "
        if let messageBody = dictionary["content"] as? String {
            body = messageBody
        } else {
            log("Received message has no value associated with the key `body`, we set the body of the message to ` ` as a default.")
        }
        
        
        
        /// `Tacking`
        var lat: Double = 0.0
        if let messageLat = dictionary["lat"] as? Double {
            lat = messageLat
        } else {
            log("Received message has no value associated with the key `lat`, we set the body of the message to ` ` as a default.")
        }
        
        
        var lng: Double = 0.0
        if let messageLng = dictionary["lng"] as? Double {
            lng = messageLng
        } else {
            log("Received message has no value associated with the key `lat`, we set the body of the message to ` ` as a default.")
        }
        
        
        
        
        /// `messageType`
        var messageType: MessageType = .text(value: " ")
       
        switch type {
       
        case .text:
            messageType = .text(value: body)
        case .image:
            messageType = .image(path: body)
        case .file:
            var fileName: String = "defaultFileName"
            if let name = dictionary["name"] as? String {
                fileName = name
            } else {
                log("Received message has no value associated with the key `name`, we set the file name of the message to `\(fileName)` as a default.")
            }
            messageType = .file(path: body, fileName: fileName)
        case .video:
            var duration: Double = 0.0
            if let stringDuration = dictionary["duration"] as? String {
                if let videoDuration = Double(stringDuration) {
                    duration = videoDuration
                } else {
                    log("Received message has a String value associated with the key `duration` but the value can not be double, we set the duration of the message to `\(duration)` as a default.")
                }
            } else if let videoDuration = dictionary["duration"] as? Double {
                duration = videoDuration
            } else {
                log("Received message has no value associated with the key `duration` as a String or Double, we set the duration of the message to `\(duration)` as a default.")
            }
            
            var thumbnail: String = ""
            if let thumbnailLink = dictionary["thumbnail"] as? String {
                thumbnail = thumbnailLink
            } else {
                log("Received message has no value associated with the key `thumbnail`, we set the thumbnail of the message to ` ` as a default.")
            }
            
            messageType = .video(path: body, duration: "\(duration)", thumbnail: thumbnail)
            
        case .sound:
            
            var duration: Double = 0.0
            if let stringDuration = dictionary["duration"] as? String {
                if let videoDuration = Double(stringDuration) {
                    duration = videoDuration
                } else {
                    log("Received message has a String value associated with the key `duration` but the value can not be double, we set the duration of the message to `\(duration)` as a default.")
                }
            } else if let videoDuration = dictionary["duration"] as? Double {
                duration = videoDuration
            } else {
                log("Received message has no value associated with the key `duration` as a String or Double, we set the duration of the message to `\(duration)` as a default.")
            }
            
            messageType = .sound(path: body, duration: "\(duration)")
            
        case .map:
            
            var latitude: Double = 0.0
            if let stringLatitude = dictionary["lat"] as? String {
                if let mapLatitude = Double(stringLatitude) {
                    latitude = mapLatitude
                } else {
                    log("Received message has a String value associated with the key `latitude` but the value can not be double, we set the latitude of the message to `\(latitude)` as a default.")
                }
            } else if let mapLatitude = dictionary["lat"] as? Double {
                latitude = mapLatitude
            } else {
                log("Received message has no value associated with the key `latitude` as a String or Double, we set the latitude of the message to `\(latitude)` as a default.")
            }
            
            
            var longitude: Double = 0.0
            if let stringLongitude = dictionary["lng"] as? String {
                if let mapLongitude = Double(stringLongitude) {
                    longitude = mapLongitude
                } else {
                    log("Received message has a String value associated with the key `latitude` but the value can not be double, we set the latitude of the message to `\(longitude)` as a default.")
                }
            } else if let mapLongitude = dictionary["lng"] as? Double {
                longitude = mapLongitude
            } else {
                log("Received message has no value associated with the key `longitude` as a String or Double, we set the longitude of the message to `\(longitude)` as a default.")
            }
            
            messageType = .map(latitude: latitude, longitude: longitude)
        }
        
        
        /// `messageId`
        var messageId: String = ""
        
        if let id = dictionary["id"] as? String {
            messageId = id
        } else if let id = dictionary["id"] as? Int {
            messageId = "\(id)"
        } else {
            log("Received message has no value associated with the key `id`, we set the id of the message to ` ` as a default.")
        }
        
        /// `roomId`
        var roomId: String = ""
        
        if let id = dictionary["room_id"] as? String {
            roomId = id
        } else if let id = dictionary["room_id"] as? Int {
            roomId = "\(id)"
        } else {
            log("Received message has no value associated with the key `room_id`, we set the roomId of the message to ` ` as a default.")
        }
        
        
        /// `avatar`
        var avatar: String = ""
        
        if let avatarLink = dictionary["avatar"] as? String {
            avatar = avatarLink
        } else {
            log("Received message has no value associated with the key `avatar`, we set the avatar of the message to ` ` as a default.")
        }
        
        
        
        /// `senderId`
        var senderId: String = ""
        
        if let id = dictionary["senderId"] as? String {
            senderId = id
        } else if let id = dictionary["senderId"] as? Int {
            senderId = "\(id)"
        } else {
            log("Received message has no value associated with the key `sender_id`, we set the senderId of the message to ` ` as a default.")
        }
        
        
        /// `senderId`
        var receiverId: String = ""
        
        if let id = dictionary["receiver_id"] as? String {
            receiverId = id
        } else if let id = dictionary["receiver_id"] as? Int {
            receiverId = "\(id)"
        } else {
            log("Received message has no value associated with the key `receiver_id`, we set the receiverId of the message to ` ` as a default.")
        }
        
        /*
         
         /// `isSender`
         var isSender: Bool = false
         
         if let isSenderStringValue = dictionary["is_sender"] as? String {
         isSender = isSenderStringValue == "1"
         } else if let isSenderStringValue = dictionary["is_sender"] as? String {
         isSender = isSenderStringValue.lowercased() == "true"
         } else if let isSenderIntValue = dictionary["is_sender"] as? Int {
         isSender = isSenderIntValue == 1
         } else {
         log("Received message has no value associated with the key `is_sender`, we set the receiverId of the message to ` false ` as a default.")
         }
         
         */
        
        /// `createdAt`
        var createdAt: String = ""
        
        if let createdAtValue = dictionary["created_at"] as? String {
            createdAt = createdAtValue
        } else {
            log("Received message has no value associated with the key `created_at`, we set the createdAt of the message to ` ` as a default.")
        }
        
          return Message(
            id: messageId,
            roomId: roomId,
            avatar: avatar,
            senderId: Int( senderId ) ?? 0 ,
            receiverId: receiverId,
            type: messageType,
            isSender: sender.id == senderId,//isSender,
            createdAt: createdAt,
            lat: lat,
            lng: lng
        )
        
        
        
    }
    
    private func log(_ message: Any ...) {
#if DEBUG
        if message.count == 1 {
            print("🚦Socket:: \(message[0])")
        } else {
            print("\n\n\n______________________________ 🚦Socket ______________________________")
            for x in message {
                print("\(x)")
            }
            print("______________________________ 🚦Socket ______________________________", terminator: "\n\n\n")
        }
#endif
    }
    
    //MARK: - Internal -
    private func checkCurrentStatus() {
        
        if self.socket.status == .notConnected {
            log("❌ Not connected")
            manager.connect()
            socket.connect()
        }
        if self.socket.status == .disconnected {
            log("🎬 Disconnected")
            manager.connect()
            socket.connect()
        }
        if self.socket.status == .connecting {
            log("⚠️ Trying To Connect...")
            manager.connect()
            socket.connect()
        }
        if self.socket.status == .connected {
            log("✅ Connected")
        }
    }
    private func observeStatus() {
        self.socket.on(clientEvent: .connect) { [weak self] (_, _) in
            self?.onConnectionStatus?(.connect)
        }
        self.socket.on(clientEvent: .disconnect) { [weak self] (_, _) in
            self?.onConnectionStatus?(.disconnect)
        }
        self.socket.on(clientEvent: .reconnect) { [weak self] (_, _) in
            self?.onConnectionStatus?(.reconnect)
        }
        
    }
    
    
    
    //MARK: - Emits -
 
    
    
    
    func addTracker(
        completion: (() -> ())?
    ) {
        var data = [String: String]()
        data[DataSocketKeys.providerId] = "\(self.receiver.id)"
        emit(for: EmitTypes.addtracker, data: data, completion: completion)
    }
    func enterChat(
        completion: (() -> ())?
    ) {
        var data = [String: String]()
        data[DataSocketKeys.conversationId] = "\(conversationId)"
        emit(for: EmitTypes.enterChat, data: data, completion: completion)
    }
    func exitChat(
        completion: (() -> ())?
    ) {
        print("ExitChatt")
        let data = [String: Any]()
        emit(for: EmitTypes.exitChat, data: data, completion: completion)
    }
    func sendMessage(
        messageType: MessageType,
        completion: (() -> ())?
    ) {
        
//        {
//            "chatId": "f4f472e7-8f7a-4562-a6d4-cee9ac394668",
//            "content": "Hello",
//            "contentType": "TEXT" // OPTIONAL NOTE: Only Text Supported For Now
//        }

        var data: [String: String] = messageType.socketParameters
       // data[DataSocketKeys.receiverId] = self.receiver.id
       //  data[DataSocketKeys.receiverType] = receiver.type.rawValue
        data[DataSocketKeys.conversationId] = self.conversationId
      
        emit(for: EmitTypes.sendMessage, data: data, completion: completion)
    }
    
    func updateLocation(
        latitude: Double,
        longitude:Double,
        completion: (() -> ())?
    ) {
        var data : [String: Double] = [:]
        data[DataSocketKeys.latitude] = latitude
        data[DataSocketKeys.longitude] = longitude
        emit(for: EmitTypes.updateLocation, data: data, completion: completion)
    }
    
    
    
    func start() {
        self.observeStatus()
        self.checkCurrentStatus()
        if self.socket.status == .connected {
            if self.ConnectionType == .chat {
                self.enterChat(completion: nil)
            }else{
                print("tracker🚗")
                self.addTracker(completion: nil)
            }
        } else {
            self.socket.on(clientEvent: .connect) { [weak self] (value, ack) in
                if self?.ConnectionType == .chat {
                    self?.enterChat(completion: nil)
                }else{
                    print("tracker🚗")
                    self?.addTracker(completion: nil)
                }
            }
        }
    }
    
    
  
    
    //MARK: - Deinit -
    deinit {
        print("ChatSocketConnection is deinit, No memory leak found")
    }
}

