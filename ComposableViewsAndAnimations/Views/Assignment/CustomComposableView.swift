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
    
   
    // Initialize a timer that will fire in one second
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        Text("\(message)")
            .font(Font
                    .custom("Futura-Bold", size: 26.0, relativeTo: .largeTitle))
       
    }
}
    
    
    struct CustomComposableView_Previews: PreviewProvider {
        static var previews: some View {
            CustomComposableView(message: "whatever")
        }
    }

