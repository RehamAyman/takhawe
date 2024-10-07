import UIKit

class ChatViewController: BaseVC {

    //MARK: - IBOutlets -
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var textView: MessageTextView!
    @IBOutlet weak private var sendButton: UIButton!
    @IBOutlet weak private var bottomConstraint: NSLayoutConstraint!
   // @IBOutlet weak private var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var providerImage: UIImageView!
    @IBOutlet weak var providerName: UILabel!
    @IBOutlet weak var navgationView:  UIView!
    
    
    
    
    //MARK: - Properties -
    
    private var messages: [MessageData] = []
    private let titleName: String
    private var conversationId: String
    private var clientId: Int?
    var partnerImage = ""
    var partnerPhoneNumber = "" 
    private let socketManger: ChatSocketConnection
    var isFinished: Bool? = false
    @IBOutlet weak var sendMessageView: UIView!
    
    
    //MARK: - Initializer -
    
    
    init(conversationId: String , titleName: String = "Chat".localized,socketManger: ChatSocketConnection) {
       
        self.conversationId = conversationId
        self.titleName = titleName
        self.socketManger = socketManger
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        print("---- image test 🌏🌏🌏")
        print(partnerImage)
        
        
        super.viewDidLoad()
        self.registerForKeyboardNotifications()
        self.setupInitialDesign()
        self.setupTableView()
        self.getMessages()
       
    }
    
    //MARK: - Design -
    
    private func setupInitialDesign() {
//        self.addLeading(title: titleName)
//        self.addDismissNavigationButton()
        
        if self.isFinished == true{
            self.sendMessageView.isHidden = true
        }
        
        self.view.backgroundColor = .secondarySystemBackground
        self.textView.onChangeTextValue = { [weak self] message in
            guard let self = self else {return}
            guard let message = message, !message.trimWhiteSpace().isEmpty else {
                self.sendButton.isHidden = true
                return
            }
            self.sendButton.isHidden = false
        }
    }

//MARK: - Actions -
    
    @IBAction func callReciver(_ sender: UIButton) {
        

        if let phoneURL = URL(string: "tel://\(self.partnerPhoneNumber)") {
                if UIApplication.shared.canOpenURL(phoneURL) {
                    UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                } else {
                    print("Your device doesn't support this feature.")
                }
            }
        
    }
    
    @IBAction private func sendButtonPressed() {
        guard let message = textView.textValue() else {return}
        socketManger.sendMessage(messageType: .text(value: message)) { [weak self] in
            guard let self = self else {return}
            let messageObject =  MessageData(id: "" , body: message  , type: "TEXT", duration: nil , name:  UserDefaults.user?.user?.name , createdDt: "now", senderId: UserDefaults.user?.user?.id ?? 0  , is_read: true, chatId: "" )
   
//            self.messages.append(messageObject)
//            self.tableView.reloadData()
            self.textView.set(text: nil)
//            UIView.animate(withDuration: 0.2) {
//                self.tableView.scrollToBottom(animated: true)
//            }
        }
    }
    
    //MARK: - Deinit -
    deinit {
        socketManger.exitChat(completion: nil)
        print("\(NSStringFromClass(self.classForCoder).components(separatedBy: ".").last ?? "BaseVC") is deinit, No memory leak found")
    }
}

//MARK: - TableView -
extension ChatViewController {
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.register(cellType: ChatTableViewCell.self)
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.backgroundColor = .clear
        self.tableView.contentInset = .init(top: 50, left: 0, bottom: 50, right: 0)
    }
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableView.setPlaceholder(isEmpty: self.messages.isEmpty)
        return self.messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ChatTableViewCell.self, for: indexPath)
        let message = self.messages[indexPath.row]
        let myId = UserDefaults.user?.user?.id ?? 0
        let isMyMessage =  myId == message.senderId  ? true : false
        
        
        
        
        print("---------- teeesssttt ")
        print(UserDefaults.user?.user?.id)
        print(myId)
    
        print(message.senderId)
        
        print(isMyMessage)
        cell.set(message: message.body, isMyMessage: isMyMessage, senderImage: self.partnerImage)
        return cell
    }
}

//MARK: - Networking -
extension ChatViewController {
    private func getMessages() {
        Task {
            do {
               
                self.providerImage.setImage(image: partnerImage)
                self.providerName.text = self.titleName
                activityIndicatorr.startAnimating()
                UserRouter.getAllLastMessaged(chatId: self.conversationId ).send { [weak self ] (response : APIGenericResponse<[MessageData]> ) in
                    guard let self = self else { return }
                        //  self.clientId = response.result?.senderId[0]
                    self.messages = response.result ?? []
                    self.messages = self.messages.reversed()
                    
                    
                    self.socketConnection()
                    self.tableView.reloadData()
                    self.tableView.scrollToBottom(animated: true)
                    
                    
                }
                
//                HomeRouter.getChat(roomid: self.conversationId).send { [weak self] (response: APIGenericResponse<ChatModel>) in
//                    guard let self = self else {return}
//                    self.conversationId = response.data?.room?.id ?? 0
//                    self.clientId = response.data?.members?[0].id
//                    self.messages = response.data?.messages?.data ?? []
//                    self.messages = self.messages.reversed()
//                    self.partnerImage = response.data?.members?[0].image ?? ""
//                    self.providerName.text = response.data?.members?[0].name
//                    self.providerImage.setWith(url: response.data?.members?[0].image)
//                    self.socketConnection()
//                    self.tableView.reloadData()
//                    self.tableView.scrollToBottom(animated: true)
//                    
//                }
 
            } catch {
               

            }
        }
    }
}

//MARK: - Socket -
extension ChatViewController {
    
    func socketConnection(){
    
        self.socketManger.onMessageReceived = { [weak self] message in
            print(" 🌏🌏🌏🌏🌏🌏🌏🌏🌏🌏ttest")
            guard let self = self else {return}
            let newMessage = MessageData(id: message.id ,
                                          
                                         body: message.type.messageBodyValue,
                                         type: "TEXT",
                                         duration: nil,
                                         name: nil,
                                         createdDt: message.createdAt ,
                                         senderId : message.senderId ,
                                         is_read: true, chatId: "")
            
            
            
            print(newMessage)

            self.messages.append(newMessage)
            self.tableView.reloadData()
            UIView.animate(withDuration: 0.2) {
            self.tableView.scrollToBottom(animated: true)
            }
        }
        self.socketManger.start()
    }
}

//MARK: - ScrollView -
extension ChatViewController {
    //Add observer for show and hide keyboard
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //Make the scroll view upper than the keyboard
    @objc func keyboardWasShown(_ notification: NSNotification) {
        guard let info = notification.userInfo,
              let keyboardFrameValue =
                info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }
        let keyboardFrame = keyboardFrameValue.cgRectValue
      //  let keyboardSize = keyboardFrame.size
      //  self.bottomConstraint.constant = keyboardSize.height
       // self.tableViewBottomConstraint.constant = keyboardSize.height
        self.tableView.contentInset = .init(top: 50, left: 0, bottom: 100, right: 0)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.tableView.scrollToBottom(animated: true)
        }
    }
    //Return the scroll view to the its original position
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
     //   self.bottomConstraint.constant = 0
   //     self.tableViewBottomConstraint.constant = 0
        self.tableView.contentInset = .init(top: 50, left: 0, bottom: 50, right: 0)
        UIView.animate(withDuration: 0.15) {
            self.view.layoutIfNeeded()
        }
    }
    
}
