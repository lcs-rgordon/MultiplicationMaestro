//
//  ContentView.swift
//  MultiplicationMaestro
//
//  Created by Russell Gordon on 2022-02-18.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // Values to be multiplied
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    
    // Holds the user's input
    @State var inputGiven = ""
    
    // Tracks whether the provided answer is correct or not
    @State var answerCorrect: Bool = false

    // MARK: Computed properties
    
    // The main user interface
    var body: some View {
        
        VStack(spacing: 0) {
    
            // Operation, values to be multiplied
            HStack {
                Text("×")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(multiplicand)")
                    Text("\(multiplier)")
                }
            }
            
            // Horizontal line
            Divider()
            
            // Result and input area
            HStack {

                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    // Only show this when the answer given is correct
                    //            CONDITION          true  false
                    .opacity(answerCorrect == true ? 1.0 : 0.0)

                Spacer()
                
                TextField("", text: $inputGiven)
                    // Ensure input is right-aligned
                    .multilineTextAlignment(.trailing)
            }
            
            // Push content up to top of screen
            Spacer()

        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
