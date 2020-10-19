//
//  ContentView.swift
//  EducationGameChallenge
//
//  Created by Josh Belmont on 10/19/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTable = 1
    @State private var isPlaying = false
    
    var body: some View {
        Group {
            if isPlaying {
                GameView(selectedTable: $selectedTable)
                Button("Quit"){
                    isPlaying = false
                }
            } else {
                SettingsView(selectedTable: $selectedTable)
                Button("Play!"){
                    isPlaying = true
                }
            }
        }
    }
}

struct GameView: View {
    @Binding var selectedTable: Int
    
    var body: some View {
        NavigationView {
            Text("You want to practice \(selectedTable)'s multiplication table")
        }.navigationBarTitle("Game View")
    }
}

struct SettingsView: View {
    @Binding var selectedTable: Int
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Multiplication Table")){
                    Stepper(value: $selectedTable, in: 1...12, step: 1) {
                        Text("Table: \(selectedTable)")
                    }
                }

            }
        }.navigationBarTitle("Settings Page!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
