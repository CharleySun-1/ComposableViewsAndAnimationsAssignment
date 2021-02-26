//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
    // MARK: Computed properties
    var body: some View {
        
        List {
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text("Description")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                    
                    Text("""
                        Just type in whatever you want and there will be an animation waiting for you!
                        """)
                    
                    TextField("Enter something", text: $phrase)
                    
                }
                .padding(.bottom)
                
            }
            
            NavigationLink(destination: CustomComposableView(message: phrase)) {
                SimpleListItemView(title: "Thing",
                                   caption: "The animation will say: \(phrase)")
            }
            
        }
        .padding()
        .navigationTitle("Random thing")
        
    }
}
struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
