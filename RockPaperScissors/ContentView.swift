//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Bünyamin Kılıçer on 25.12.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var states = ["Rock","Paper","Scissors"].shuffled()
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var showComputerImage = false
    @State private var score = 0
    @State private var disableButtons = false
    @State private var showingScore = false
    @State private var alertTitle = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image(states[computerChoice])
                .resizable()
                .frame(width: 150, height: 150)
                .blur(radius: showComputerImage ? 0 : 30)
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.largeTitle)
                .foregroundColor(Color.red)
            
            Spacer()
            
            HStack {
                Button {
                    playerSelected(choice: "Rock")
                } label: {
                    Image("Rock")
                        .resizable()
                        .frame(width: 100, height: 100)
                }.disabled(disableButtons)
                
                Button {
                    playerSelected(choice: "Paper")
                } label: {
                    Image("Paper")
                        .resizable()
                        .frame(width: 100, height: 100)
                }.disabled(disableButtons)
                
                Button {
                    playerSelected(choice: "Scissors")
                } label: {
                    Image("Scissors")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    
                }.disabled(disableButtons)
                
                    .alert(isPresented: $showingScore) {
                        Alert(title: Text(alertTitle), message: Text("Score: \(score)"), dismissButton: Alert.Button.default(Text("Retry"), action: {
                            regenerateGame()
                        }))
                    }
            }
        }
    }
    
    func playerSelected(choice: String) {
        disableButtons = true
        if choice == "Scissors" {
            if states[computerChoice] == "Paper" {
                alertTitle = "Congrats"
                score += 1
            } else {
                alertTitle = ":("
            }
        }
        
        if choice == "Rock" {
            if states[computerChoice] == "Scissors" {
                alertTitle = "Congrats"
                score += 1
            } else {
                alertTitle = ":("
            }
        }
        
        if choice == "Paper" {
            if states[computerChoice] == "Rock" {
                alertTitle = "Congrats"
                score += 1
            } else {
                alertTitle = ":("
            }
        }
        showComputerImage = true
        showingScore = true
            
    }
    
    func regenerateGame() {
        disableButtons = false
        computerChoice = Int.random(in: 0...2)
        showComputerImage = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
