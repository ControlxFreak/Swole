//
//  SquatView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/13/22.
//

import SwiftUI
import ConfettiSwiftUI

struct SquatView: View {
    @State private var manmode: Bool = false
    @State private var count: Int = 0
    @State private var goal: Int = 10000
    @State private var increment: Int = 25

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Button {
                count += increment
            } label: {
                Image("cat-squat")
                .resizable()
                .scaledToFit()
                .padding()
            }.confettiCannon(counter: $count, num: 50, radius: 500.0)
            ProgressView(value: Float(count), total: Float(goal))
            {
                HStack{
                    Text("\(count) / \(goal)")
                    Spacer()
                    Text(String(format: "%.2f", 100*Float(count)/Float(goal)) + "%")
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
