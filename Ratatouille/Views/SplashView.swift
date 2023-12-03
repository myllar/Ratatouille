//
//  SplashView.swift
//  Ratatouille
//
//  Created by oscar student on 01/12/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    @State var animateScale = 0.0
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                BottomTabView()
            } else {
                Rectangle()
                    .ignoresSafeArea()
                    .background(Color.black)
                ZStack{
                    Image("image_splashView")
                        .padding()
                        .scaleEffect(animateScale)
                }
                .onAppear {
                    let animateSplash = Animation.easeInOut(duration: 0.9)
                    let infinite = animateSplash.repeatForever(autoreverses: true)
                    withAnimation (infinite) {
                        animateScale = 1.0
                    }
                }
            }
        }
    
        .onAppear() {
            //3e+9 == 3 seconds, from nano
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}


#Preview {
    SplashView()
}
