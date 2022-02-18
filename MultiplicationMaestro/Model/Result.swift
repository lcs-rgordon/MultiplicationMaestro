//
//  Result.swift
//  MultiplicationMaestro
//
//  Created by Russell Gordon on 2022-02-18.
//

import Foundation

// Tracks the result of answering a single question
struct Result: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let multiplicand: Int
    let multiplier: Int
    let inputGiven: String
    let answerCorrect: Bool
    
    // MARK: Computed properties
    var correctProduct: Int {
        return multiplicand * multiplier
    }

}
