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
    
    // Scale factor for the entire image
    @State private var scaleFactor: CGFloat = 1.0
    
    // Whether to apply the animation
    @State private var useAnimation = false
    
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
            
                    
                }
        }
        
        
    }



struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "whatever")
    }
}

