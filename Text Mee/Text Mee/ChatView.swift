//
//  ChatView.swift
//  Text Mee
//
//  Created by Abhirath Sujith on 05/07/22.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    
    let chat: Chat
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader { reader in
                ScrollView {
                    getMessagesView(viewWidth: reader.size.width)
                }
            }
            .background(Color.cyan)
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.markAsUnread(false, chat: chat)
        }
        
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0){
            ForEach(chat.messages) { message in
                let isRecevied = message.type == .Received
                HStack {
                    ZStack{
                        Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(isRecevied ? Color.black.opacity(0.3) : .green.opacity(0.8))
                    }
                    .frame(width: viewWidth * 0.7, alignment: isRecevied ? .leading : .trailing)
                    .padding(.vertical)
                    .background(Color.orange)
                   
                }
                .frame(maxWidth: .infinity, alignment: isRecevied ? .leading : .trailing)
            }
        }
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject(ChatsViewModel())
    }
}
