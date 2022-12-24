//
//  ExerciseView.swift
//  Swole
//
//  Created by Anthony Trezza on 12/18/22.
//
import Foundation
import SwiftUI
import ConfettiSwiftUI

struct ExerciseView: View {
    // Define the generic variables
    @Binding var type : String
    @Binding var count : Int
    @Binding var goal : Int
    @Binding var inc : Int

    // Counter for the confetti cannon
    @State var conf : Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            // ======================= //
            // Cat Button
            // ======================= //
            Image("cat-\(type)")
                .resizable()
                .scaledToFit()
                .padding()
                .onTapGesture(count: 2){
                    count -= inc
                }
                .onTapGesture(count: 1) {
                    count += inc
                    conf += 1
                }
                .confettiCannon(counter: $conf, num: 50, radius: 500.0)
            // ======================= //
            // Progress Bar
            // ======================= //
            ProgressView(value: Float(count), total: Float(goal))
            {
                HStack{
                    Text("\(count) / \(goal)")
                        .foregroundColor(.black)
                    Spacer()
                    Text(String(format: "%.2f", 100*Float(count)/Float(goal)) + "%")
                        .foregroundColor(.black)
                }
            }.padding()
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}

