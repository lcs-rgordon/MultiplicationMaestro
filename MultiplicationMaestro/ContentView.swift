//
//  ContentView.swift
//  MultiplicationMaestro
//
//  Created by Russell Gordon on 2022-02-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 0) {
    
            // Operation, values to be multiplied
            HStack {
                Text("×")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("7")
                    Text("8")
                }
            }
            
            // Horizontal line
            Divider()
            
            // Result and input area
            HStack {

                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)

                Spacer()
                
                TextField("", text: .constant("56"))
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
