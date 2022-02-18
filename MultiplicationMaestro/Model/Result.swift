//
//  Result.swift
//  MultiplicationMaestro
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
