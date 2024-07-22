//
//  Gesture1View.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/21/24.
//

import SwiftUI

struct CircleView: View {
    @Binding var centerPoint: CGPoint
    var body: some View {
        Circle()
            .offset(CGSize(width: centerPoint.x, height: centerPoint.y))
            .size(CGSize(width: 30.0, height: 30.0))
            .fill(.red)
            
    }
}


struct Gesture1View: View {
    @State private var dragePoint: CGPoint = .zero
    @State private var showSheet: Bool = false
    var body: some View {
        
        GeometryReader { proxy in
            VStack(spacing: 0, content: {
                Text("dfdf")
                Rectangle()
                    .fill(.gray)
                    .frame(height: 200)
                    .gesture (
                        DragGesture()
                            .onChanged({ value in
                                dragePoint = value.location
                            })
                            .onEnded({ value in
                            
                            })
                    )
                    .overlay {
                        CircleView(centerPoint: $dragePoint)
                    }
                Button {
                    showSheet = true
                } label: {
                    Text("ShowModal")
                }
                .padding(.top, 100)
//                .sheet(isPresented: $showSheet, content: {
//                    PanModalView()
//                })
//                .fullScreenCover(isPresented: $showSheet, content: {
//                    PanModalView()
//                })
            })
            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
        }
    }
}

#Preview {
    Gesture1View()
}
