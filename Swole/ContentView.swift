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
    // Pushup Data
    @State private var pushup_name: String = "pushup"
    @AppStorage("pushup_count") private var pushup_count = 0
    @AppStorage("pushup_goal") private var pushup_goal = 10000
    @AppStorage("pushup_inc") private var pushup_inc = 10

    // Situp Data
    @State private var situp_name: String = "situp"
    @AppStorage("situp_count") private var situp_count = 0
    @AppStorage("situp_goal") private var situp_goal = 10000
    @AppStorage("situp_inc") private var situp_inc = 10
    
    // Squat Data
    @State private var squat_name: String = "squat"
    @AppStorage("squat_count") private var squat_count = 0
    @AppStorage("squat_goal") private var squat_goal = 10000
    @AppStorage("squat_inc") private var squat_inc = 10

    // Main View
    var body: some View {
        TabView {
            ExerciseView(
                type: $pushup_name,
                count: $pushup_count,
                goal: $pushup_goal,
                inc: $pushup_inc
            )
            ExerciseView(
                type: $situp_name,
                count: $situp_count,
                goal: $situp_goal,
                inc: $situp_inc
            )
            ExerciseView(
                type: $squat_name,
                count: $squat_count,
                goal: $squat_goal,
                inc: $squat_inc
            )
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
