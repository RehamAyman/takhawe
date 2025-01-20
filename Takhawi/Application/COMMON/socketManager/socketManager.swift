import SocketIO

class MySocketManager {
    var socket: SocketIOClient!
    var timer: Timer?
    
    let manager = SocketIO.SocketManager(socketURL: URL(string: Server.imageBase.rawValue)!, config: [
        .log(true),
        .compress,
        .reconnects(true),        // Automatically try to reconnect
        .reconnectWait(5) ,
        .extraHeaders(["authorization": UserDefaults.accessToken ?? ""
                        , "Accept-Language": LocalizationManager.shared.getLanguage() == .Arabic ? "ar" : "en" ])
    ])
    
    
    
    @objc func performTask(lat : Double , lng : Double ) {
        let data: [String: Any] = [
            "lat": lat ,
            "lng": lng
        ]
        
         print("Task performed!")
         // Add your task code here
        self.socket.emit("update location", data)
     }
     
     // Start repeating the function every 30 seconds
     func startRepeatingTask() {
         timer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(performTask), userInfo: nil, repeats: true)
     }
     
     // Stop repeating the function
     func stopRepeatingTask() {
         timer?.invalidate()
         timer = nil
     }
    
    
    

    func connect() {
      
        socket = manager.defaultSocket
        
        // Handle connection events
        
        socket.on(clientEvent: .connect) { data, ack in
            print("🌏...Socket connected🌏")
        }
        
        socket.on(clientEvent: .error) { data, ack in
            print("❌❌❌❌.Socket error: \(data)")
        }
        // Handle custom events
        if socket.status != .connected && socket.status != .connecting {
            print("🌏Connecting socket...")
            socket.connect()
        } else {
            print("🌏Socket is already connected or in the process of connecting")
        }
    }
    
    
    func disconnect() {
        print(" 🌏🌏 disconnect 🌏🌏")
        //socket.disconnect()
    }
    
    

    func sendMessage(message: String) {
        socket.emit("message", message)
    }
    
 
    
    func sendPing() {
        socket.emit("pingFromClient", "ping")
    }
    

    func startPinging() {
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { _ in
            if self.socket.status == .connected {
                self.sendPing()
                print("Ping sent")
            } else {
                print("Socket is not connected")
            }
        }
    }
    
    
    
//MARK: - -- PROVIDER UPDATE HIS LOCATION  --
    func sendMyLocation ( lat : Double , lng : Double ) {
        let LocationData: [String: Any] = [
            "lat": lat ,
            "lng": lng
        ]
        
        print("🥹 \(socket.status)")
        
        
        if self.socket.status != .connected {
            
            socket.on(clientEvent: .connect) { data, ack in
                print("1- update my location to the server ")
                self.socket.emit("update location", LocationData )
                
            }
        } else {
            print("2- update my location to the server ")
            self.socket.emit("update location", LocationData )
        }
    
       
    }
    
// /Trip status change/
    
    
    
    
    
    
    func listenToTripStatus ( completion: @escaping (updateStatusResult) -> Void)   {
        
        
        //trip status change
        socket.on( "trip status change") { data, ack in
            
            print("🌏socket back with trip status changes data 🌏")
            print(data)
            
            if let dataArray = data as? [[String: Any]] {
                    do {
                        // Convert the array of dictionaries into JSON data
                        let jsonData = try JSONSerialization.data(withJSONObject: dataArray, options: [])
                        // Decode the JSON data into an array of Offer objects
                        let status = try JSONDecoder().decode([updateStatusResult].self, from: jsonData)
                        completion ( status.first ?? updateStatusResult(status: "") )
                    } catch {
                        print("Error decoding trip status changes data: \(error)")
                    }
                } else {
                        print("Data format is not as expected")
                }
        }
    }
    
    
    
 //MARK: - -- USER LISTEN TO NEW OFFERS METHOD --
    
    
    
    func listenToUserOffers ( completion: @escaping ([offerResult]) -> Void)   {
        socket.on( "new offer") { data, ack in
            print("🌏socket back with new offers  data 🌏")
            print(data)
            
            if let dataArray = data as? [[String: Any]] {
                    do {
                        // Convert the array of dictionaries into JSON data
                        let jsonData = try JSONSerialization.data(withJSONObject: dataArray, options: [])
                        // Decode the JSON data into an array of Offer objects
                        let offers = try JSONDecoder().decode([offerResult].self, from: jsonData)
                        completion ( offers )
                    } catch {
                        print("Error decoding offers: \(error)")
                    }
                } else {
                        print("Data format is not as expected")
                }
        }
    }
    
    //driver location
    
    func listenToDRIVERLOCATION ( completion: @escaping (driverUpdateLocation) -> Void)   {
        socket.on( "driver location") { data, ack in
            print("🌏socket back with new offers  data 🌏")
            print(data)
            if let dataArray = data as? [[String: Any]] {
                    do {
                        // Convert the array of dictionaries into JSON data
                        let jsonData = try JSONSerialization.data(withJSONObject: dataArray, options: [])
                        // Decode the JSON data into an array of Offer objects
                        let offers = try JSONDecoder().decode(driverUpdateLocation.self, from: jsonData)
                        completion ( offers )
                    } catch {
                        print("Error decoding offers: \(error)")
                    }
                } else {
                        print("Data format is not as expected")
                }
        }
    }
    
    
//MARK: - -- PROVIDER LISTEN TO NEW VIP TRIPS COMMING  METHOD --
    
    func providerVipTripsListener (completion: @escaping ([SocketVIP_Trip]) -> Void ) {
        
        socket.on( "new vip trip") { data, ack in
            print("🌏socket back with new trips  data 🌏")
            print(data)
            if let dataArray = data as? [[String: Any]] {
                    do {
                        // Convert the array of dictionaries into JSON data
                        let jsonData = try JSONSerialization.data(withJSONObject: dataArray, options: [])
                        // Decode the JSON data into an array of Offer objects
                        let offers = try JSONDecoder().decode([SocketVIP_Trip].self, from: jsonData)
                        completion ( offers )
                    } catch {
                        print("Error decoding offers: \(error)")
                    }
                } else {
                        print("Data format is not as expected")
                }
        }
        
        
    }
}





