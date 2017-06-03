//
//  CodeGenerator.swift
//  
//
//  Created by Craig Rhodes on 5/12/17.
//
//

import Foundation

final class CodeGenerator {
    func generateLlvm(from ast: Ast) {
        let astString = convertToString(ast)
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Could not get current directory")
            return
        }
        let path = dir.appendingPathComponent("Test.b")
        do {
            try astString.write(to: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to generate code.")
        }
    }
    
    private func convertToString(_ ast: Ast) -> String {
        return "Hello, world!"
    }
}
