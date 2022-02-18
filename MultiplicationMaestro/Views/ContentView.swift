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

    // Tracks whether the input has even been checked yet
    @State var answerChecked: Bool = false

    // Tracks whether the provided answer is correct or not
    @State var answerCorrect: Bool = false
    
    // Tracks the results of all questions answered so far
    @State var results: [Result] = []

    // MARK: Computed properties
    
    // Gets updated as new values are randomly generated
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
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

                ZStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        // Only show this when the answer given is correct
                        //            CONDITION          true  false
                        .opacity(answerCorrect == true ? 1.0 : 0.0)

                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                        // Show this when both of the following situations are true:
                        // 1. Answer has been checked.
                        // 2. Answer was not correct.
                        // Necessary since if we show this only when an answer is incorrect,
                        // with no other conditions, it would show as soon as a new
                        // question is generated.
                        //                 CONDITION1  AND  CONDITION2             true  false
                        .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
                }

                Spacer()
                
                TextField("", text: $inputGiven)
                    // Ensure input is right-aligned
                    .multilineTextAlignment(.trailing)
            }
            
            // Buttons to control program
            ZStack {
                
                // Allow input to be checked
                Button(action: {
                    
                    // If we've gotten to this point, the answer has at least been checked
                    answerChecked = true
                    
                    // Convert the provided input (String) into integer (Int) if possible
                    guard let answerGiven = Int(inputGiven) else {
                        // User gave invalid input (e.g.: typed 'mangos' rather than 5)
                        answerCorrect = false
                        // Save this result
                        saveResult()
                        // Stop checking the answer
                        return
                    }
                    
                    // Is the integer given actually correct?
                    if answerGiven == correctProduct {
                        answerCorrect = true
                    } else {
                        answerCorrect = false
                    }

                    // Save this result
                    saveResult()

                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                    // Only show this button when an answer has not been checked
                    .opacity(answerChecked == false ? 1.0 : 0.0)
                    .padding()
                    .buttonStyle(.bordered)
                
                // Allow new question to be generated
                Button(action: {
                    
                    // Generate a new question
                    multiplicand = Int.random(in: 1...12)
                    multiplier = Int.random(in: 1...12)
                    
                    // Reset properties that track what's happening with the current question
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the input field
                    inputGiven = ""
                    
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                    // Only show this button when an answer has been checked
                    .opacity(answerChecked == true ? 1.0 : 0.0)

            }

            // Show results of prior qusetions attempted
            List(results) { result in
                HStack {
                    Text("\(result.multiplicand)")
                    Text("×")
                    Text("\(result.multiplier)")
                    Text("=")
                    Text("\(result.inputGiven)")
                    Text("(\(result.correctProduct))")
                        .opacity(result.answerCorrect == false ? 1.0 : 0.0)
                    Spacer()
                    ZStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.green)
                            .opacity(result.answerCorrect == true ? 1.0 : 0.0)

                        Image(systemName: "x.square")
                            .foregroundColor(.red)
                            .opacity(result.answerCorrect == false ? 1.0 : 0.0)
                    }
                }
                .font(.title)
            }
            
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        
    }
    
    // MARK: Functions
    
    // Save the result of a question that has been answered
    func saveResult() {
        
        // Create a result to save based on current question state
        let newResult = Result(multiplicand: multiplicand,
                               multiplier: multiplier,
                               inputGiven: inputGiven,
                               answerCorrect: answerCorrect)
        
        // Ensure most recent result is always at top of the list
        results.insert(newResult, at: 0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
