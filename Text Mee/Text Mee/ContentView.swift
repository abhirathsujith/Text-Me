//
//  ContentView.swift
//  Text Mee
//
//  Created by Abhirath Sujith on 04/07/22.
//

import SwiftUI


struct ContentView: View {
    

    var body: some View {
       Text("Text Mee").padding()
        NavigationView {
            List {
                ForEach(0..<10) { i in
                    Text(String(i))
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
