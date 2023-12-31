//
//  ContentView.swift
//  SwiftUI-GuessTheFlag-Sample
//
//  Created by ekayaint on 1.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                      Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                      Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    } //: VStack
                    
                    
                    ForEach(0..<3) {number in
                        Button {
                            if number == correctAnswer {
                                scoreTitle = "Correct"
                            } else {
                                scoreTitle = "Wrong"
                            }
                            showingScore = true
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                } //: VStack
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: ???")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            } //: VStack
            .padding()
        } //: ZStack
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                countries.shuffle()
                correctAnswer = Int.random(in: 0...2)
            }
        } message: {
            Text("Your score is ???")
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
