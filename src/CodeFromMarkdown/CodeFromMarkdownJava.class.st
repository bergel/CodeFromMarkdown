Class {
	#name : #CodeFromMarkdownJava,
	#superclass : #AbstractCodeFromMarkdown,
	#category : #CodeFromMarkdown
}

{ #category : #'as yet unclassified' }
CodeFromMarkdownJava >> chapter03Perceptron [
	<script: 'self new chapter03Perceptron'>
	
	(self processFileName: '03-Perceptron/ch3_perceptron.md') install.
	
]

{ #category : #public }
CodeFromMarkdownJava >> codeClass [
	^ CFMCodeJava
]

{ #category : #public }
CodeFromMarkdownJava >> markdownCodeKeyword [
	^ 'Java'
]

{ #category : #public }
CodeFromMarkdownJava >> rootFolderName [
	"Root folder of where the book is located. Note that it ends with /"
	^ '/Users/alexandrebergel/Dropbox/Workspace/AgileArtificialIntelligenceInJava/book/'
]
