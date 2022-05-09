//
//  HomePodShape.swift
//  Objects (iOS)
//
//  Created by 김경호 on 2022/05/05.
//

import SwiftUI

struct HomePodShape: View {
    let homePodWidth: CGFloat
    
    var body: some View {
        let glassWidth = homePodWidth * 0.62
        let buttonWidth = homePodWidth / 21.0
        
        ZStack {
            Mesh(meshWidth: homePodWidth)
            Glass(glassWidth: glassWidth)
                .overlay(
                    Buttons(buttonWidth: buttonWidth)
                )
        }
    }
}

struct Mesh: View {
    let meshWidth: CGFloat
    
    var body: some View {
        Circle()
            .fill(Color(uiColor: .systemGray5))
            .frame(width: meshWidth, height: meshWidth)
            .shadow(color: .init(white: 0.0).opacity(0.1), radius: 8.0, x: 0.0, y: 0.0)
    }
}

struct Glass: View {
    let glassWidth: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(uiColor: .systemGray6))
                .frame(width: glassWidth, height: glassWidth)
            Circle()
                .strokeBorder(Color(uiColor: .systemGray4))
                .frame(width: glassWidth, height: glassWidth)
        }
    }
}

struct Buttons: View {
    let buttonWidth: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            ButtonShape(buttonWidth: buttonWidth)
            Spacer(minLength: buttonWidth * 6.0)
            ZStack {
                ButtonShape(buttonWidth: buttonWidth)
                ButtonShape(buttonWidth: buttonWidth)
                    .rotationEffect(.degrees(90.0))
            }
            Spacer()
        }
    }
}

struct ButtonShape: View {
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat = 2.0
    
    var body: some View {
        Capsule()
            .fill(.white)
            .frame(width: buttonWidth, height: buttonHeight)
    }
}

struct HomePodShape_Previews: PreviewProvider {
    static var previews: some View {
        let homePodWidth = 210.0
        
        HomePodShape(homePodWidth: homePodWidth)
            .frame(width: homePodWidth, height: homePodWidth)
            .previewLayout(.sizeThatFits)
    }
}
