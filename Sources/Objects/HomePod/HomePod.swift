//
//  HomePod.swift
//  Objects (iOS)
//
//  Created by 김경호 on 2022/05/05.
//

import SwiftUI

struct HomePod: View {
    var body: some View {
        GeometryReader { geometry in
            let homePodWidth = min(geometry.size.width * 0.6, geometry.size.height * 0.6)
            
            ZStack {
                Color.clear
                Circle()
                    .fill(.pink)
                    .frame(width: homePodWidth * 0.05, height: homePodWidth * 0.05)
                    .modifier(ParticlesModifier(duration: homePodWidth * 0.02))
                HomePodShape(homePodWidth: homePodWidth)
            }
        }
        .navigationTitle("HomePod")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomePod_Previews: PreviewProvider {
    static var previews: some View {
        HomePod()
    }
}

extension NSNotification.Name {
    static let musicStarted = Notification.Name("musicStarted")
    static let musicStopped = Notification.Name("musicStopped")
}
