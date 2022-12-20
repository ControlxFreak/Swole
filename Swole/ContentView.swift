//
//  PushupView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/18/22.
//

import Foundation
import SwiftUI
import ConfettiSwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            PushupView()
            SitupView()
            SquatView()
            SettingsView()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
