Class {
	#name : #CodeFromMarkdownPharoAgileVisualization2,
	#superclass : #AbstractCodeFromMarkdown,
	#category : #CodeFromMarkdown
}

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter01Introduction [
	<script: 'self new chapter01Introduction'>
	"There is nothing in this chapter, but this is sanity check"	
	
	(self processFileName: '01-04-PharoInANutshell/PharoInANutshell.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> codeClass [
	^ CFMCodePharo
]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> markdownCodeKeyword [
	^ 'Smalltalk'
]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> rootFolderName [
	"Root folder of where the book is located. Note that it ends with /"
	^ '/Users/alexandrebergel/Dropbox/Workspace/books/AgileVisualizationAPress/book'
]
