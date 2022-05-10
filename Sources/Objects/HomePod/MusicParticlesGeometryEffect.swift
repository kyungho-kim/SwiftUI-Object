//
//  MusicParticlesGeometryEffect.swift
//  Objects
//
//  Created by 김경호 on 2022/05/10.
//

import SwiftUI

struct MusicParticlesGeometryEffect: GeometryEffect {
    var time: Double
    var speed: Double = .random(in: 30...40)
    var direction: Double = .random(in: (-.pi)...(.pi))
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
