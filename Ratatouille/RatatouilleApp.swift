import SwiftUI


@main
struct RatatouilleApp: App {
    @StateObject private var dataController = DataController()
    @AppStorage("isDarkMode") public var isDarkMode = true
    
    var body: some Scene {
        
        WindowGroup {
            VStack {
//                BottomTabView()
                SplashView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
//check for changes in app settings
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}


#Preview {
    ArchiveView()
}
