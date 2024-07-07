//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by JeongHyun Kim on 6/27/24.
//

import SwiftUI

struct ContentView: View {
    let routeList = [Router]([.goods,.registerBase,.list])
    var body: some View {
        NavigationView(content: {
            List(routeList, id: \.id) { route in
                NavigationLink {
                    route.view
                } label: {
                    Text(route.title)
                }

            }
        })
    }
}

#Preview {
    ContentView()
}
