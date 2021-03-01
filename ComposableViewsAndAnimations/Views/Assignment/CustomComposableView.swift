//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    // MARK: Stored properties
    
    // What to say?
    var message: String
    
    @State private var selected = 0
    
    // Scale factor for the entire image
    @State private var scaleFactor: CGFloat = 1.0
    
    
    // Opacity of each part of the view
    @State private var opacityOuter = 0.0
    @State private var opacityMiddle = 0.0
    @State private var opacityCentre = 0.0
    @State private var opacityText = 0.0
    
    // The gradient colour that will be used in the shape later
    var blueBackground = LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomLeading)
    
    var grayBackground = LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .topLeading, endPoint: .bottomLeading)
    
    var gradients: [LinearGradient] {
        return [blueBackground, grayBackground, grayBackground]
    }
    
    // Initialize a timer that will fire in one second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            Text("\(message)")
                .font(Font.custom("Rockwell-Bold", size: 24.0, relativeTo: .largeTitle))
                .bold()
                .opacity(opacityText)       // Applies only to views above
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(25.0)
                .opacity(opacityCentre)     // Applies only to views above
                .padding()
                .background(Color.orange)
                .cornerRadius(30.0)
                .opacity(opacityMiddle)     // Applies only to views above
                .padding()
                .background(Color.yellow)
                .cornerRadius(35.0)
                .opacity(opacityOuter)      // Applies only to views above
                .scaleEffect(scaleFactor)   // Applies only to views above
                .onReceive(timer) { input in
                    
                    withAnimation(Animation.easeIn(duration: 0.5).delay(0.5)) {
                        opacityOuter = 1.0
                    }
                    withAnimation(Animation.easeIn(duration: 0.5).delay(1.0)) {
                        opacityMiddle = 1.0
                    }
                    withAnimation(Animation.easeIn(duration: 0.5).delay(1.5)) {
                        opacityCentre = 1.0
                    }
                    withAnimation(Animation.easeIn(duration: 0.5).delay(2.0)) {
                        opacityText = 1.0
                    }
                    withAnimation(Animation.interpolatingSpring(mass: 0.75, stiffness: 0.9, damping: 0.75, initialVelocity: 8).delay(2.5)) {
                        scaleFactor = 1.25
                    }
                    
                    // Stop the timer from continuing to fire
                    timer.upstream.connect().cancel()
                    
                }
            
            
            
        }
        
    }
    
}


struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "whatever")
    }
}

