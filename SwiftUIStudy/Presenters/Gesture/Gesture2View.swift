//
//  Gesture2View.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/22/24.
//

import SwiftUI

struct Gesture2View: View {
    @State private var dragePoint: CGPoint = .zero
    @State private var showSheet: Bool = false
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                VStack(spacing: 0, content: {
                    Rectangle()
                        .fill(.green)
                        .frame(width: 100, height: 200)
                    
                    Text("이곳은 뒤에 뷰")
                    Text("이것 저것 있지요")
                    Spacer().frame(height: 200)
                    Button {
                        showSheet = true
                    } label: {
                        Text("ShowModal")
                    }
                    .padding(.top, 30)
                })
                if showSheet {
                    PanModalView()
                }
            }
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
    }
}

#Preview {
    Gesture2View()
}
