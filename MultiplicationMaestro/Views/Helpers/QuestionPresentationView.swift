//
//  QuestionPresentationView.swift
//  MultiplicationMaestro
//
//  Created by Russell Gordon on 2022-05-01.
//

import SwiftUI

struct QuestionPresentationView: View {
    
    // MARK: Stored properties
    let multiplicand: Int
    let multiplier: Int
    
    // MARK: Computed properties
    var body: some View {
        
        // Operation, values to be multiplied
        HStack {
            Text("×")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(multiplicand)")
                Text("\(multiplier)")
            }
        }

    }
}

struct QuestionPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPresentationView(multiplicand: 7,
                                 multiplier: 8)
    }
}
