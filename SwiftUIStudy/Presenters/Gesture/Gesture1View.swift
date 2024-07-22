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
            ScrollView {
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
                    .padding([.top,.bottom],20)
                    
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 50)
                        .overlay(
                            Text("Tap")
                        )
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    print("TapTap")
                                })
                        )
                        .padding(.bottom,50)
                    
                    Rectangle().fill(.green)
                        .frame(height: 100)
                        .padding(.bottom,50)
                        .overlay(
                            Text("Longpress")
                        )
                        .gesture(
                            LongPressGesture(minimumDuration: 1,maximumDistance: 20)
                                .onChanged({ start in
                                    print("LongPress",start)
                                })
                                .onEnded({ value in
                                    print(value)
                                })
                        )
                    
              
                    
                    if #available(iOS 17.0, *) {
                        
                        Rectangle().fill(.red)
                            .frame(height: 100)
                            .padding(.bottom,50)
                            .overlay(
                                Text("RotateGesture")
                            )
                            .gesture(
                                RotateGesture()
                                    .onChanged({ value in
                                        print(value)
                                    })
                                    .onEnded({ value in
                                        print(value)
                                    })
                            )
                        
                        Rectangle().fill(.red)
                            .frame(height: 100)
                            .padding(.bottom,50)
                            .overlay(
                                Text("MagnificationGesture")
                            )
                            .gesture(
                                MagnifyGesture(minimumScaleDelta: 1.0)
                                    .onChanged({ value in
                                        print(value)
                                    })
                                    .onEnded({ value in
                                        print(value)
                                    })
                            )
                    }
                    /// 두개를 모두 인식
                    Rectangle().fill(.brown)
                        .frame(height: 100)
                        .padding(.bottom,50)
                        .overlay(
                            Text("Tap & Log")
                        )
                        .gesture(
                            SimultaneousGesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        print("Tap")
                                    }),
                                LongPressGesture(minimumDuration: 2)
                                    .onEnded({ long in
                                        print("LongPress")
                                    })
                            )
                        )
                /// 둘중에 하나만 인식
                    Rectangle().fill(.yellow)
                        .frame(height: 100)
                        .padding(.bottom,50)
                        .overlay(
                            Text("Tap & Log")
                        )
                        .gesture(
                            ExclusiveGesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        print("Tap")
                                    }),
                                LongPressGesture(minimumDuration: 2)
                                    .onEnded({ long in
                                        print("LongPress")
                                    })
                            )
                        )
                    
                    ///  두개 이상을 순차적으로 적용
                        Rectangle().fill(.yellow)
                            .frame(height: 100)
                            .padding(.bottom,50)
                            .overlay(
                                Text("Tap & Log")
                            )
                            .gesture(
                                SequenceGesture(
                                    TapGesture()
                                        .onEnded({ _ in
                                            print("Tap")
                                        }),
                                    LongPressGesture(minimumDuration: 2)
                                        .onEnded({ long in
                                            print("LongPress")
                                        })
                                )
                            )
                        
                    
                    
                    
                })
//                .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.height)
                //                .sheet(isPresented: $showSheet, content: {
                //                    PanModalView()
                //                })
                                .fullScreenCover(isPresented: $showSheet, content: {
                                    PanModalView()
                                })
            }
        }
    }
}

#Preview {
    Gesture1View()
}
