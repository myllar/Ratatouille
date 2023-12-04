import SwiftUI


struct BottomTabView: View {
    
    var body: some View {
        
        VStack{
            Image("image_titleImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(height: 80)
            
            TabView {
                MyFavoriteMeals()
                    .tabItem { Label("Mine oppskrifter", systemImage: "takeoutbag.and.cup.and.straw")
                    }
                
                SearchView()
                    .tabItem { Label("Søk", systemImage: "doc.text.magnifyingglass")
                    }
                
                SettingsView()
                    .tabItem { Label("Innstillinger", systemImage: "gearshape")
                    }
                }
            }
            .accentColor(Color("BrandPrimary"))
//            .onAppear() {
//                print("TabView showing")
//            }
        }
    }
#Preview {
    BottomTabView()
}
