//
//  PushupView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/18/22.
//

import Foundation
import SwiftUI
import ConfettiSwiftUI

struct PushupView: View {
    @AppStorage("pushup_count") private var pushup_count = 0
    @AppStorage("pushup_goal") private var pushup_goal = 10000
    @AppStorage("pushup_inc") private var pushup_inc = 10

    @State var confcounter : Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Button {
                pushup_count += pushup_inc
                confcounter += 1
            } label: {
                Image("cat-pushup")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .confettiCannon(counter: $confcounter, num: 50, radius: 500.0)
            ProgressView(value: Float(pushup_count), total: Float(pushup_goal))
            {
                HStack{
                    Text("\(pushup_count) / \(pushup_goal)")
                    Spacer()
                    Text(String(format: "%.2f", 100*Float(pushup_count)/Float(pushup_goal)) + "%")
                }
            }.padding()
            Spacer()
        }
        .padding()
    }
}

struct PushupView_Previews: PreviewProvider {
    static var previews: some View {
        PushupView()
    }
}
