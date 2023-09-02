//
//  ContentView.swift
//  SwiftUI-GuessTheFlag-Sample
//
//  Created by ekayaint on 1.09.2023.
//

import SwiftUI

struct ContentView: View {
    let countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        VStack {
            VStack {
              Text("Tap the flag of")
              Text(countries[correctAnswer])
            }  //: VStack
            
            ForEach(0..<3) {number in
                Button {
                    //flas was tapped
                } label: {
                    Image(countries[number])
                        .renderingMode(.original)
                }
            }
        } //: VStack
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
