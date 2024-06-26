//
//  AnimationCircleView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 6/27/24.
//

import SwiftUI

struct AnimationCircleView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var scale = 1.0
    @State private var circleColor: Color = Color.gray.opacity(0.7)
    var colorValue: Color
    
    var body: some View {
        Circle().foregroundColor(circleColor)
            .frame(width: 10,height: 10)
            .scaleEffect(scale)
            .onAppear {
                let baseAnimation = Animation.linear(duration: 2)
                let repeated = baseAnimation.repeatForever(autoreverses: false)
                
                withAnimation(repeated) {
                    scale = 3
                    circleColor = colorValue.opacity(0.0)
                }
            }
    }
}


#Preview {
    AnimationCircleView(colorValue: .red)
}
