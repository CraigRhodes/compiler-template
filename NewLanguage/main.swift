import Foundation
import Regex

	
// Verify commandline args count
if CommandLine.arguments.count != 2 {
	print("Error")
	exit(1)
}

// Get file to compile as an arg
let filename = CommandLine.arguments[1]

// Create objects necessary for compilation
let scanner = Scanner()
let parser = Parser()
let semanticChecker = SemanticChecker()
let codeGen = CodeGenerator()
	
// Begin compilation
guard let tokens: [Scanner.Token] = scanner.tokenize(filename) else {
	exit(1)	
}
let ast: Ast = parser.parse(tokens)
guard semanticChecker.isValid(ast) else {
	exit(1)
}
codeGen.generateLlvm(from: ast)