//
//  Ast.swift
//  
//
//  Created by Craig Rhodes on 5/12/17.
//
//

import Foundation

/// An Abstract Syntax Tree.
struct Ast {
    private var head: Node?


    init() {
    	head = nil
    }

    private struct Node {
        var data: String
        var childNodes: [Node]
    }
}
