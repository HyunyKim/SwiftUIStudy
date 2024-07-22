//
//  PanModalView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/22/24.
//

import SwiftUI

struct PanModalView: View {
    @State private var yPosition: CGFloat = 0
    @State private var fullHeight: CGFloat = 0
    private var limitPanLocation: CGFloat = 200
    var body: some View {
        GeometryReader(content: { geometry in
            VStack(spacing: 0, content: {
                Rectangle()
                    .fill(.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipShape(RoundedCorners(tl: 25, tr: 25, bl: 0, br: 0))
                    .shadow(radius: 10)
                    .overlay {
                        VStack(spacing: 0, content: {
                            Spacer().frame(height: 1)
                            HStack(content: {
                                Image(systemName: "line.3.horizontal")
                            })
                            .frame(width: geometry.size.width)
                            .padding(.top, 10)
//                            .background(.red)
                            Spacer()
                            VStack(spacing: 5, content: {
                                Button {
                                    print("item1")
                                } label: {
                                    Text("item1")
                                }
                                Button {
                                    print("item2")
                                } label: {
                                    Text("item2")
                                }
                                Button {
                                    print("item3")
                                } label: {
                                    Text("item3")
                                }
                                Button {
                                    print("item4")
                                } label: {
                                    Text("item5")
                                }
                            })
                            Spacer()
                        })
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if yPosition + value.translation.height > limitPanLocation {
                                        yPosition += value.translation.height
                                    }
                                })
                        )
                    }
            })
            .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            .offset(y:yPosition)
            .onAppear() {
                yPosition = geometry.size.height - 50
                fullHeight = geometry.size.height - 50
            }
        })
        .background(
            .black.opacity( min((((fullHeight / yPosition) / 10.0) + 0.4), 1.0))
        )

    }
}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height
        let tr = min(min(self.tr, height/2), width/2)
        let tl = min(min(self.tl, height/2), width/2)
        let bl = min(min(self.bl, height/2), width/2)
        let br = min(min(self.br, height/2), width/2)

        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: width - tr, y: 0))
        path.addArc(center: CGPoint(x: width - tr, y: tr), radius: tr, startAngle: Angle.degrees(-90), endAngle: Angle.degrees(0), clockwise: false)
        path.addLine(to: CGPoint(x: width, y: height - br))
        path.addArc(center: CGPoint(x: width - br, y: height - br), radius: br, startAngle: Angle.degrees(0), endAngle: Angle.degrees(90), clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: height))
        path.addArc(center: CGPoint(x: bl, y: height - bl), radius: bl, startAngle: Angle.degrees(90), endAngle: Angle.degrees(180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle.degrees(180), endAngle: Angle.degrees(270), clockwise: false)
        path.closeSubpath()

        return path
    }
}

#Preview {
    PanModalView()
}
