//
//  ChatRow.swift
//  Text Mee
//
//  Created by Abhirath Sujith on 04/07/22.
//

import SwiftUI

struct ChatRow: View {
    var body: some View {
        HStack{
            Image("1")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
         
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text("AA")
                            .bold()
                        
                        Spacer()
                        
                        Text("01/06/2022")
                    }
                    
                    HStack{
                        Text("Hiiiii")
                            .foregroundColor(.blue)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing,40)
                    }
                }
            }
        }
        .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow()
    }
}
