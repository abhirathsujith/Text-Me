//
//  ContentView.swift
//  Text Mee
//
//  Created by Abhirath Sujith on 04/07/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""
    

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                    
                    
                    NavigationLink(destination: {
                        Text(chat.person.name)
                    }){
                        ChatRow(chat: chat)
                        
                    }
                    
                    
                    ChatRow(chat: chat)
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
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
