//
//  ContentView.swift
//  Shared
//
//  Created by 김경호 on 2022/05/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HomePod()) {
                    Text("HomePod")
                }
            }
            .navigationTitle("Objects")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
