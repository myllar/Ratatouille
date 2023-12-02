////
////  ContentView.swift
////  Ratatouille
////
////  Created by oscar student on 13/11/2023.
////



import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Help") {
                            print("Help tapped!")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
