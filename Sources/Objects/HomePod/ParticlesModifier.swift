//
//  ParticlesModifier.swift
//  Objects
//
//  Created by 김경호 on 2022/05/10.
//

import SwiftUI

struct ParticlesModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    let duration: Double
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<40, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80.0))
                    .scaleEffect(scale)
                    .modifier(MusicParticlesGeometryEffect(time: time))
                    .opacity((duration - time) / duration)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .musicStarted)) { _ in
            withAnimation(.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.time = 0.0
                self.scale = 0.1
                NotificationCenter.default.post(name: .musicStopped, object: nil)
            }
        }
    }
}
