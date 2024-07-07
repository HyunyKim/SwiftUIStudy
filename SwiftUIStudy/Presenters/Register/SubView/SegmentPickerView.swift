//
//  AddressInputView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 7/2/24.
//

import SwiftUI

struct SegmentPickerView: View {
    
    @Binding var selectedSegment: Int
    
    @State private var testIndex = 0
    
    var segments: [String]
    
    var body: some View {
        VStack {
            Picker("Options", selection: $selectedSegment) {
                ForEach(0..<segments.count, id: \.self) { index in
                    Text(segments[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text("Selected segment: \(segments[selectedSegment])")
                .padding()

            Spacer()
        }
        .padding()
    }
}
//
//#Preview {
//    SegmentPickerView(selectedSegment: .constant(0),segments: ["집","직장","직접입력"])
//}
