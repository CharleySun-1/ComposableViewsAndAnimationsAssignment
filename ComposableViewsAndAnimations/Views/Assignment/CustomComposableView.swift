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
    
    @State var downOffset: CGFloat = -100.0
    @State var upOffset: CGFloat = 150.0
    
    var message: String
    
    var body: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint))
            .frame(width: 100, height: 100)
            .offset(y: shouldAnimate ? upOffset : downOffset)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            
            .overlay(
                ZStack {
                    Text("\(message)")
                        .font(Font.custom("Futura-Bold", size: 26.0, relativeTo: .largeTitle))
                        .bold()
                        .foregroundColor(Color.white)
                        .offset(y: shouldAnimate ? upOffset : downOffset)
                        
                    
                    Circle()
                        .stroke(Color.purple, lineWidth: 100)
                        .scaleEffect(shouldAnimate ? 1 : 0)
                        .offset(y: shouldAnimate ? upOffset : downOffset)
                        
                    Circle()
                        .stroke(Color.red, lineWidth: 100)
                        .scaleEffect(shouldAnimate ? 1.5 : 0)
                        .offset(y: shouldAnimate ? upOffset : downOffset)
                        
                    Circle()
                        .stroke(Color.pink
                                , lineWidth: 100)
                        .scaleEffect(shouldAnimate ? 2 : 0)
                        .offset(y: shouldAnimate ? upOffset : downOffset)
                        
                }
                .opacity(shouldAnimate ? 0.0 : 0.2)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
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

