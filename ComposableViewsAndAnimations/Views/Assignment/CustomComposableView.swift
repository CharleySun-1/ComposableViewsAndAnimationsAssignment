//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    @State private var shouldAnimate = false
    
    @State var gradient = [Color.pink, Color.purple, Color.orange]
      @State var startPoint = UnitPoint(x: 0, y: 0)
      @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var message: String
    
    var body: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .frame(width: 100, height: 100)
            .overlay(
                ZStack {
                    Text("\(message)")
                        .font(Font.custom("Futura-Bold", size: 24.0, relativeTo: .largeTitle))
                        .bold()
                  
                    Circle()
                        .stroke(Color.purple, lineWidth: 100)
                        .scaleEffect(shouldAnimate ? 1 : 0)
                    Circle()
                        .stroke(Color.red, lineWidth: 100)
                        .scaleEffect(shouldAnimate ? 1.5 : 0)
                    Circle()
                        .stroke(Color.pink
                    , lineWidth: 100)
                        .scaleEffect(shouldAnimate ? 2 : 0)
                }
                .opacity(shouldAnimate ? 0.0 : 0.2)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
        )
        .onAppear {
            self.shouldAnimate = true
        }
    }
    
}


struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "whatever")
    }
}

