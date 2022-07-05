//
//  ChatModel.swift
//  Text Mee
//
//  Created by Abhirath Sujith on 04/07/22.
//

import Foundation
struct Chat: Identifiable{
    var id: UUID{ person.id}
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable{
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable{
    
    enum MessageType {
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date)
    {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType){
         self.init(text, type: type, date: Date())
    }
}


extension Chat {
    
    
    static let sampleChat = [
        Chat(person: Person(name: "ABB", imgString: "1"), messages: [
            Message ("Hey AB", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("HAHAHAHA", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "ACC", imgString: "2"), messages: [
            Message ("Hey ACC", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am ABB", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("That's What", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        
        Chat(person: Person(name: "ADD", imgString: "3"), messages: [
            Message ("Hey ADD", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("Always like this?", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        
        Chat(person: Person(name: "AEE", imgString: "4"), messages: [
            Message ("Hey ADD", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("Heyyyyy", type:
            .Received, date: Date()),
            ], hasUnreadMessage: false),
        
        
        Chat(person: Person(name: "AFF", imgString: "5"), messages: [
            Message ("Hey AB", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("Box?", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "AGG", imgString: "6"), messages: [
            Message ("Hey AB", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("Byeee", type:
            .Received, date: Date()),
            ], hasUnreadMessage: false),
        
        
        Chat(person: Person(name: "AHH", imgString: "7"), messages: [
            Message ("Hey AB", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("Veryy much", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "AII", imgString: "8"), messages: [
            Message ("Hey AB", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("New App?", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        Chat(person: Person(name: "ALL", imgString: "9"), messages: [
            Message ("Hey AB", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("I am just developing an WhatsApp Clone App and it is so hard to create a fake chat conversation. Can you help me out with it?", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 3)),
            Message ("Please I need your help @", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message ("Sure how can I help you flo?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("Maybe you send me some \"good\" jokes @", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 2)),
            Message ("Sure I can do that. No problem @@", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message ("What do you call a fish with no eyes?", type: .Received, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message( "Hmm, Idk", type: .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message("A fsh", type:
            .Received,
            date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("OMG so bad @@", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("Let me try one", type:
                    .Sent, date: Date(timeIntervalSinceNow:
            -86400 * 1)),
            Message ("There are 10 types of people in this world, those who understand binary and those who don't", type:
                    .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message ("Made for iOS!!!", type:
            .Received, date: Date()),
            ], hasUnreadMessage: true),
        
        
    ]
}
