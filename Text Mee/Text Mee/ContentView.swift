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
                    
                    ZStack{
                        
                        ChatRow(chat: chat)
                        
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
                        }){
                            EmptyView()
                            
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true){
                        Button(action: {
                            viewModel.markAsUnread(true, chat: chat)
                        }) {
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                                
                            } else {
                                Label("Unread", systemImage: "circle.fill")
                            }
                        }
                        .tint(.orange)
                    }
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
