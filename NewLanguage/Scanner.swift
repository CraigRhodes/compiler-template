//
//  Scanner.swift
//  
//
//  Created by Craig Rhodes on 5/12/17.
//
//

import Foundation
import Regex

/// A scanner for tokenizing a file.
final class Scanner {
    typealias Token = String
    
    func tokenize(_ filename: String) -> [Token]? {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let path = URL(fileURLWithPath: filename, relativeTo: currentDirectoryURL)

        let fileContents: String
        do {
            fileContents = try String(contentsOf: path, encoding: String.Encoding.utf8)
        } catch {
            print("Could not find file \(filename)")
            return nil
        }
        
        // Get tokens from file
        guard let tokens = tokens(from: fileContents) else {
            print("Failed to tokenize file. Syntax error likely.")
            return nil
        }
        
        return tokens
    }
    
    private func tokens(from string: String) -> [Token]? {
        
        // Split by whitespace characters
        let stringComponents = string.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
        
        var stringTokens: [Scanner.Token] = []
        for stringComponent in stringComponents {
            guard let token = token(from: stringComponent) else {
                return nil
            }
            stringTokens.append(token)
        }
        
        return stringTokens
    }

    private func token(from string: String) -> Scanner.Token? {
        
        if StaticToken.allValues.contains(string) {
            return string
        }

        switch string {
        case Regex("^(\\w[\\w\\d]*)$"):
            if let id = Regex.lastMatch?.captures[0] {
                
            }
        default:
            print("Unexpected token: \(string)")
            return nil
            
        }
    }
    
    enum StaticToken: Token {
        
        // Primitives
        case int = "int"
        case char = "char"
        case float = "float"
        case double = "double"
        
        static let all: [StaticToken] = [.int, .char, .float, .double]
        static var allValues: [String] {
            return StaticToken.all.map { $0.rawValue }
        }
    }
}

class ID {
    
}
