//
//  SitupView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/18/22.
//
import Foundation
import SwiftUI
import ConfettiSwiftUI

struct SitupView: View {
    @AppStorage("situp_count") private var situp_count = 0
    @AppStorage("situp_goal") private var situp_goal = 10000
    @AppStorage("situp_inc") private var situp_inc = 10

    @State var confcounter : Int = 0

    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Image("cat-situp")
                .resizable()
                .scaledToFit()
                .padding()
                .onTapGesture(count: 2){
                    situp_count -= situp_inc
                }
                .onTapGesture(count: 1) {
                    situp_count += situp_inc
                    confcounter += 1
                }
                .confettiCannon(counter: $confcounter, num: 50, radius: 500.0)
            ProgressView(value: Float(situp_count), total: Float(situp_goal))
            {
                HStack{
                    Text("\(situp_count) / \(situp_goal)")
                        .foregroundColor(.black)
                    Spacer()
                    Text(String(format: "%.2f", 100*Float(situp_count)/Float(situp_goal)) + "%")
                        .foregroundColor(.black)
                }
            }.padding()
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}

struct SitupView_Previews: PreviewProvider {
    static var previews: some View {
        SitupView()
    }
}
