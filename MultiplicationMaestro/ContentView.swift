//
//  ContentView.swift
//  MultiplicationMaestro
//
//  Created by Russell Gordon on 2022-02-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // Operation, values to be multiplied
        HStack {
            Text("×")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("7")
                Text("8")
            }
        }
        .padding()
        .font(.system(size: 72))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
