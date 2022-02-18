//
//  ResultVisibility.swift
//  MultiplicationMaestro
//

import Foundation

// An enumeration is like a Bool, or boolean value, in that
// an enumeration has a defined list of possible values.
// The advantage is that with an enumeration, we can control
// what the possible values are.

// ResultVisibility is used to determine what results
// should be visible in the list of results below the
// question and answer interface.
enum ResultVisibility: String {
    case all = "All"
    case incorrect = "Incorrect"
    case correct = "Correct"
}
