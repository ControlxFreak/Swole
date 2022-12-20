//
//  SquatView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/18/22.
//
import Foundation
import SwiftUI
import ConfettiSwiftUI

struct SquatView: View {
    @AppStorage("squat_count") private var squat_count = 0
    @AppStorage("squat_goal") private var squat_goal = 10000
    @AppStorage("squat_inc") private var squat_inc = 10

    @State var confcounter : Int = 0

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Button {
                squat_count += squat_inc
                confcounter += 1
            } label: {
                Image("cat-squat")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .confettiCannon(counter: $confcounter, num: 50, radius: 500.0)
            ProgressView(value: Float(squat_count), total: Float(squat_goal))
            {
                HStack{
                    Text("\(squat_count) / \(squat_goal)")
                    Spacer()
                    Text(String(format: "%.2f", 100*Float(squat_count)/Float(squat_goal)) + "%")
                }
            }.padding()
            Spacer()
        }
        .padding()
    }
}

struct SquatView_Previews: PreviewProvider {
    static var previews: some View {
        SquatView()
    }
}
