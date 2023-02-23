//
//  HeartShapeView.swift
//  HeartShape
//
//  Created by tahe on 20/2/2023.
//

import SwiftUI

// First Method...

//struct HeartShapeView: View {
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .frame(width: 200, height: 200, alignment: .center)
//                .foregroundColor(.red)
//
//
//            Circle()
//                .frame(width: 200, height: 200, alignment: .center)
//                .padding(.top, -200)
//                .foregroundColor(.red)
//
//            Circle()
//                .frame(width: 200, height: 200, alignment: .center)
//                .padding(.trailing, -200)
//                .foregroundColor(.red)
//        }
//        .rotationEffect(Angle(degrees: -45))
//    }
//}

// Second Method...

struct HeartShapeView: View {
    
    @State private var drawAmount: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 180))
                path.addCurve(to: CGPoint(x: 200, y: 430), control1: CGPoint(x: 300, y: 10), control2: CGPoint(x: 550, y: 250))
                path.addCurve(to: CGPoint(x: 200, y: 180), control1: CGPoint(x: -140, y: 250), control2: CGPoint(x: 100, y: 0))
            }
            .trim(from: 0, to: drawAmount) // Use trim modifier to draw the whole path...
            .stroke(Color.red, lineWidth: 5) // Add stroke to the path
            .scaleEffect(0.7)
            .scaleEffect(scale)
            .shadow(color: Color.white.opacity(1), radius: 10, x: 0, y: 8) // Add Shadow to the path to look more popping...
        }
        .padding(.top, 70)
        .onAppear {
            // Animate the drawAmount property to draw the path...
            
            withAnimation(Animation.easeOut(duration: 1.0)) {
                self.drawAmount = 1.0
            }
            
            // Wait for the drawing animation to finish before starting the beating animation...
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(Animation.easeOut(duration: 0.1).repeatForever()) {
                    self.scale = 1.3
                }
                
                withAnimation(Animation.easeOut(duration: 0.2).delay(0.1).repeatForever()) {
                    self.scale = 1.0
                }
                
            }
            
        }
    }
}

struct HeartShapeView_Previews: PreviewProvider {
    static var previews: some View {
        HeartShapeView()
    }
}
