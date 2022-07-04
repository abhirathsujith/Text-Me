//
//  ContentView.swift
//  Text Mee
//
//  Created by Abhirath Sujith on 04/07/22.
//

import SwiftUI


struct ContentView: View {
    
    let chats = Chat.sampleChat
    

    var body: some View {
      // Text("Text Mee").padding()
        NavigationView {
            List {
                ForEach(chats) { chat in
                    ChatRow(chat: chat)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("MyChats")
            .navigationBarItems(trailing: Button(action: { }){
                   Image(systemName: "Car")
            })
      }

   }
}
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
