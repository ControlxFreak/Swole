//
//  SettingsView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/19/22.
//

import Foundation
import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}


struct SettingsView: View {
    @AppStorage("pushup_count") private var pushup_count = 0
    @AppStorage("pushup_goal") private var pushup_goal = 10000
    @AppStorage("pushup_inc") private var pushup_inc = 30
    
    @AppStorage("situp_count") private var situp_count = 0
    @AppStorage("situp_goal") private var situp_goal = 20000
    @AppStorage("situp_inc") private var situp_inc = 60

    @AppStorage("squat_count") private var squat_count = 0
    @AppStorage("squat_goal") private var squat_goal = 10000
    @AppStorage("squat_inc") private var squat_inc = 30

    @State var pushup_count_input = ""
    @State var pushup_goal_input = ""
    @State var pushup_inc_input = ""

    @State var situp_count_input = ""
    @State var situp_goal_input = ""
    @State var situp_inc_input = ""

    @State var squat_count_input = ""
    @State var squat_goal_input = ""
    @State var squat_inc_input = ""
    
    @State private var show_save_alert = false
    @State private var show_clear_alert = false

    func clearSettings() {
        // Pushups
        pushup_count_input = ""
        pushup_goal_input = ""
        pushup_inc_input = ""
        
        // Situps
        situp_count_input = ""
        situp_goal_input = ""
        situp_inc_input = ""
        
        // Squats
        squat_count_input = ""
        squat_goal_input = ""
        squat_inc_input = ""

        show_clear_alert = true
    }

    func saveSettings() {
        
        // Save the settings
        // Pushups
        pushup_count = Int(pushup_count_input) ?? pushup_count
        pushup_goal = Int(pushup_goal_input) ?? pushup_goal
        pushup_inc = Int(pushup_inc_input) ?? pushup_inc

        // Situps
        situp_count = Int(situp_count_input) ?? situp_count
        situp_goal = Int(situp_goal_input) ?? situp_goal
        situp_inc = Int(situp_inc_input) ?? situp_inc

        // Squats
        squat_count = Int(squat_count_input) ?? squat_count
        squat_goal = Int(squat_goal_input) ?? squat_goal
        squat_inc = Int(squat_inc_input) ?? squat_inc
        
        // Clear the settings
        // Pushups
        pushup_count_input = ""
        pushup_goal_input = ""
        pushup_inc_input = ""
        
        // Situps
        situp_count_input = ""
        situp_goal_input = ""
        situp_inc_input = ""
        
        // Squats
        squat_count_input = ""
        squat_goal_input = ""
        squat_inc_input = ""

        // Popup Alert
        show_save_alert = true
    }

    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Pushups")) {
                    HStack{
                        Text("Count")
                        TextField("\(pushup_count)", text: $pushup_count_input)                        .modifier(TextFieldClearButton(text: $pushup_count_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                    HStack{
                        Text("Goal")
                        TextField("\(pushup_goal)", text: $pushup_goal_input).modifier(TextFieldClearButton(text: $pushup_goal_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                    HStack{
                        Text("Increment")
                        TextField("\(pushup_inc)", text: $pushup_inc_input).modifier(TextFieldClearButton(text: $pushup_inc_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                }
                Section(header: Text("Situps")) {
                    HStack{
                        Text("Count")
                        TextField("\(situp_count)", text: $situp_count_input).modifier(TextFieldClearButton(text: $situp_count_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                    HStack{
                        Text("Goal")
                        TextField("\(situp_goal)", text: $situp_goal_input).modifier(TextFieldClearButton(text: $situp_goal_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                    HStack{
                        Text("Increment")
                        TextField("\(situp_inc)", text: $situp_inc_input).modifier(TextFieldClearButton(text: $situp_inc_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                }
                Section(header: Text("Squats")) {
                    HStack{
                        Text("Count")
                        TextField("\(squat_count)", text: $squat_count_input).modifier(TextFieldClearButton(text: $squat_count_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                    HStack{
                        Text("Goal")
                        TextField("\(squat_goal)", text: $squat_goal_input).modifier(TextFieldClearButton(text: $squat_goal_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                    HStack{
                        Text("Increment")
                        TextField("\(squat_inc)", text: $squat_inc_input).modifier(TextFieldClearButton(text: $squat_inc_input))
                            .multilineTextAlignment(.leading)
                            .padding()
                            .keyboardType(.decimalPad)
                    }
                }
                Button(action : {saveSettings()}){
                    Text("Save")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }.alert("Settings Saved!", isPresented: $show_save_alert) {
                    Button("OK", role: .cancel) {}
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                .background(Color.blue)
                .cornerRadius(25)

            }.listRowBackground(Color(UIColor.systemGroupedBackground))
        }.navigationViewStyle(.stack)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
