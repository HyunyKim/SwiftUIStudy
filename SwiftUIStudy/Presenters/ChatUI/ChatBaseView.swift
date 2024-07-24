//
//  ChatBaseView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/24/24.
//

import SwiftUI

struct ChatBaseView: View {
    private var messageList: [String] = ["message1 asdfㅁㄴㅇㅁㄴasdfasdfasdfasdf","이건 메세지2","이건 메세지3,ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ"]
    var body: some View {
        ScrollView(.vertical) {
            GeometryReader(content: { geometry in
                LazyVStack(alignment:.trailing, spacing: 10, content: {
                    ForEach(messageList,id:\.self) { message in
                        HStack(spacing: 0, content: {
                            Text(message)
                                .padding(5)
                                .background(.red)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .padding(.trailing, 10)
                                
                        })
                        .frame(maxWidth: geometry.size.width * 0.6, alignment: .trailing)
                        .background(.blue)
                        
                    }
                })
//                .frame(maxWidth: geometry.size.width)
                    .background(.yellow)
            })
        }
    }
}

#Preview {
    ChatBaseView()
}
