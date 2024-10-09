//
//  messagesExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 05/04/1446 AH.
//

import UIKit



extension messagesViewVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if  self.chats.count == 0 {
           self.tableView.isHidden = true
           self.tableView.isUserInteractionEnabled = false
       }else {
           self.tableView.isHidden = false
           self.tableView.isUserInteractionEnabled = true 
       }
        return self.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messagesCell", for: indexPath) as! messagesCell
        let item = self.chats[indexPath.row]
        cell.selectionStyle = .none
        cell.lastMessage.text = item.last_message?.content ?? ""
        cell.senderName.text = item.user?.name ?? ""
        if let image = item.user?.avatar {
            cell.senderImage.setImage(image: Server.imageBase.rawValue + image )
        }
         let count = item.unread_messages  ?? 0
        if count != 0 {
            cell.unreadLabel.text = "\(count)"
        } else {
            cell.unreadContainer.isHidden = true
        }
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.chats[indexPath.row]
        let myAvatarLink = Server.imageBase.rawValue +  (UserDefaults.user?.user?.avatar ?? "" )
        let vc = ChatViewController(conversationId:  item.id ?? ""
                                    , titleName: item.user?.name ?? ""  ,
                                    socketManger:
                                        ChatSocketConnection(ConnectionType: .chat, conversationId: item.id ?? ""  ,
                                         sender: .init(type: .client, id: "\(UserDefaults.user?.user?.id ?? 0)",
                                                       senderName: UserDefaults.user?.user?.name ?? "" , avatar: myAvatarLink ),
                                                             receiver: .init(id: "\(item.driverId ?? 0)", type: .provider)))
        vc.partnerImage = Server.imageBase.rawValue + ( item.user?.avatar ?? "" )
        vc.partnerPhoneNumber = item.user?.phone ?? ""
        self.push(vc)
    }
}
