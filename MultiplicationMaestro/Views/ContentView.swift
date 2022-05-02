//
//  ContentView.swift
//  MultiplicationMaestro
//
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

            // Present the question
            QuestionPresentationView(multiplicand: multiplicand,
                                     multiplier: multiplier)
            
            // Horizontal line
            Divider()
            
            // Result and input area
            AnswerAndResultView(answerChecked: answerChecked,
                                answerCorrect: answerCorrect,
                                inputGiven: $inputGiven)
            
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

            // Show results of prior questions attempted
            List(results) { currentResult in
                // Use a helper view to display each prior result
                PriorResultView(result: currentResult)
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
        
        // Insert most recent result in the first position in list
        // This ensures newer results at top of list; older at bottom
        results.insert(newResult, at: 0)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
