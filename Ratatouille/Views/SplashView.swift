import SwiftUI


struct SplashView: View {
    
    @State var isActive: Bool = false
    @State var animateScale = 0.0
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                BottomTabView()
            } else {
                    ZStack{
                        Rectangle()
                            .scaledToFill()
                            .ignoresSafeArea()
                            Color.black
                        Image("image_splashView")
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .scaleEffect(animateScale)
                    }
                    .ignoresSafeArea()
                
//onAppear SplashView
                    .onAppear {
                        let animateSplash = Animation.easeInOut(duration: 0.9)
                        let infinite = animateSplash.repeatForever(autoreverses: true)
                        withAnimation (infinite) {
                            animateScale = 1.0
                        }
                    }
                }
            }
         
//onAppear BottomTabView when isActive
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
