//
//  SplashView.swift
//  Ratatouille
//
//  Created by oscar student on 01/12/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                BottomTabView()
            } else {
                Rectangle()
//                    .ignoresSafeArea()
                    .background(Color.black)
                ZStack{
                    Image("image_splashView")
//                        .resizable()
//                        .scaledToFit()
                    Spacer()
                    Text("Hello!")
                }
            }
        }
    
        .onAppear() {                                        //3e+9 == 3 seconds, from nano
            DispatchQueue.main.asyncAfter(deadline: .now() + 300e+9) {
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
