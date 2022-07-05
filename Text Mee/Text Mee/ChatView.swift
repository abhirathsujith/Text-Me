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
    
    @State private var text = ""
    @FocusState private var isFocused
    
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
        VStack(spacing: 0){
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        getMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDToScroll) { _ in
                                if let messageID = messageIDToScroll {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                    
                                }
                                
                            }
                            .onAppear {
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                        
                    }
                    
                }
            }
           // .background(Color.cyan)
            .padding(.bottom, 5)
            
            
            
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navBarLeadingBtn, trailing: navBarTrailingBtn)
        .onAppear{
            viewModel.markAsUnread(false, chat: chat)
        }
        
    }
    
    var navBarLeadingBtn: some View {
        Button(action: {}) {
            HStack {
                Image(chat.person.imgString)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text(chat.person.name).bold()
            }
            .foregroundColor(.black)
            
        }
    }
    
    var navBarTrailingBtn: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "phone")
            }
            
            Button(action: {}) {
                Image(systemName: "camera")
            }
        }
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 35
            HStack {
                TextField("Message Here.....", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .focused($isFocused)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(text.isEmpty ? .blue : .cyan)
                        .frame(width: height, height: height)
                        .background(
                        Circle()
                            .foregroundColor(text.isEmpty ? .orange : .yellow)
                        )
                   }
                   .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thinMaterial)
    }
    
    
    func sendMessage() {
        if let message = viewModel.sendMessage(text, in: chat){
            text = ""
            messageIDToScroll = message.id
        }
        
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0){
            let sectionMessage = viewModel.getSectionMessages(for: chat)
            ForEach(sectionMessage.indices, id: \.self) { sectionIndex in
                let messages = sectionMessage[sectionIndex]
                Section(header: sectionHeader(firstMessage: messages.first!)) {
                    ForEach(messages) { message in
                        let isRecevied = message.type == .Received
                        HStack {
                            ZStack{
                                Text(message.text)
                                    .padding(.horizontal)
                                    .padding(.vertical, 13)
                                    .background(isRecevied ? Color.yellow.opacity(1) : .orange.opacity(1))
                                    .cornerRadius(15)
                            }
                            .frame(width: viewWidth * 0.7, alignment: isRecevied ? .leading : .trailing)
                            .padding(.vertical)
                            //.background(Color.orange)
                           
                        }
                        .frame(maxWidth: .infinity, alignment: isRecevied ? .leading : .trailing)
                        .id(message.id)
                    }
                    
                }
            
            }
        }
    }
    
    
    func sectionHeader(firstMessage message: Message) -> some View {
        ZStack {
            Text(message.date.descriptiveString(dateStyle: .medium))
                .foregroundColor(.white)
                .font(.system(size: 13, weight: .regular))
                .frame(width: 120)
                .padding(.vertical, 5)
                .background(Capsule().foregroundColor(.cyan .opacity(1.5)))
            
        }
        
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
        
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(chat: Chat.sampleChat[0])
                .environmentObject(ChatsViewModel())
        }
       
    }
}
