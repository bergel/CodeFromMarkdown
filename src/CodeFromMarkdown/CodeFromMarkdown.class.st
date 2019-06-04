Class {
	#name : #CodeFromMarkdown,
	#superclass : #Object,
	#instVars : [
		'extractedCodes'
	],
	#category : #CodeFromMarkdown
}

{ #category : #accessing }
CodeFromMarkdown >> extractedCodes [
	^ extractedCodes
]

{ #category : #initialization }
CodeFromMarkdown >> initialize [
	super initialize.
	extractedCodes := OrderedCollection new
]

{ #category : #actions }
CodeFromMarkdown >> install [
	extractedCodes do: #install
]

{ #category : #accessing }
CodeFromMarkdown >> numberOfExtractedCode [
	^ extractedCodes size
]

{ #category : #public }
CodeFromMarkdown >> processFileName: aFilename [
	"
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/07-MatrixLibrary/07-Matrix.markdown') install
	"
	self processText: aFilename asFileReference contents
]

{ #category : #public }
CodeFromMarkdown >> processText: aText [

	| isInCode currentCode code |
	isInCode := false.
	currentCode := OrderedCollection new. 
	aText lines doWithIndex: [ :l :lineNumber |
"self haltIf: [ l beginsWith: 'MMatrix>>add: aMatrix']."
		((l = '```') and: [ isInCode ]) ifTrue: [ isInCode := false. code := CFMCode new code: (String cr join: currentCode); lineNumber: lineNumber; yourself. extractedCodes add: code ].	
		isInCode ifTrue: [ 
			currentCode add: l
		].
		(l = '```Smalltalk') ifTrue: [ isInCode := true. currentCode := OrderedCollection new ].
	 ]
]
