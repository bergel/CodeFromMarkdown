Class {
	#name : #AbstractCodeFromMarkdown,
	#superclass : #Object,
	#instVars : [
		'extractedCodes'
	],
	#category : #CodeFromMarkdown
}

{ #category : #public }
AbstractCodeFromMarkdown >> codeClass [
	self subclassResponsibility 
]

{ #category : #accessing }
AbstractCodeFromMarkdown >> extractedCodes [
	^ extractedCodes
]

{ #category : #initialization }
AbstractCodeFromMarkdown >> initialize [
	super initialize.
	extractedCodes := OrderedCollection new
]

{ #category : #actions }
AbstractCodeFromMarkdown >> install [
	extractedCodes do: #install
]

{ #category : #public }
AbstractCodeFromMarkdown >> markdownCodeKeyword [
	"What is the code keyword?? For example, in the markdown code ```Smalltalk
	then the keyword is java."
	self subclassResponsibility 
]

{ #category : #accessing }
AbstractCodeFromMarkdown >> numberOfExtractedCode [
	^ extractedCodes size
]

{ #category : #public }
AbstractCodeFromMarkdown >> processFileName: aFilename [
	"
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/07-MatrixLibrary/07-Matrix.markdown') install.
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/08-MatrixNN/08-MatrixNN.markdown') install.
	"
	"Check if the filename is absolute. If not, then we prepend the rootFolder"
	| t |
	t := (aFilename beginsWith: '/') ifTrue: [ aFilename ] ifFalse: [ self rootFolderName, aFilename ].
	self processText: t asFileReference contents
]

{ #category : #public }
AbstractCodeFromMarkdown >> processText: aText [
	| isInCode currentCode code |
	isInCode := false.
	currentCode := OrderedCollection new.
	aText lines doWithIndex: [ :l :lineNumber | 
		"End of the code section"
		(l = '```' and: [ isInCode ]) ifTrue: [ 
			isInCode := false.
			code := self codeClass new
				        code: (String cr join: currentCode);
				        lineNumber: lineNumber;
				        yourself.
			extractedCodes add: code ].
		
		(l = '...' and: [ isInCode ]) ifTrue: [ 
			currentCode := extractedCodes last code lines asOrderedCollection ].
		isInCode ifTrue: [ currentCode add: l ].

		"Begining of a code section"
		l = ('```' , self markdownCodeKeyword) ifTrue: [ 
			isInCode := true.
			currentCode := OrderedCollection new ] ]
]

{ #category : #public }
AbstractCodeFromMarkdown >> rootFolderName [
	"Root folder of where the book is located. Note that it ends with /"
	self subclassResponsibility 
]
