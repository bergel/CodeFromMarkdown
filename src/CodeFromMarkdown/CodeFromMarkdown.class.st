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

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> geneticAlgo [
	<script: 'self new geneticAlgo'>
	
	self removePackageNameIfExist: 'GeneticAlgorithm'.
	
	(self processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/10-GeneticAlgorithm/10-GeneticAlgorithm.markdown') install.

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

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> matrixAndMatrixLib [
	<script: 'self new matrixAndMatrixLib'>
	
	self removePackageNameIfExist: 'Matrix'.
	self removePackageNameIfExist: 'NeuralNetwork-Matrix'.
	
	(self processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/07-MatrixLibrary/07-Matrix.markdown') install.
	(self processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/08-MatrixNN/08-MatrixNN.markdown') install.
	
]

{ #category : #accessing }
CodeFromMarkdown >> numberOfExtractedCode [
	^ extractedCodes size
]

{ #category : #public }
CodeFromMarkdown >> processFileName: aFilename [
	"
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/07-MatrixLibrary/07-Matrix.markdown') install.
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/08-MatrixNN/08-MatrixNN.markdown') install.
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
		(l = '...' and: [ isInCode ]) ifTrue: [ currentCode := extractedCodes last code lines asOrderedCollection ].
		isInCode ifTrue: [ 
			currentCode add: l
		].
		(l = '```Smalltalk') ifTrue: [ isInCode := true. currentCode := OrderedCollection new ].
	 ]
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> removePackageNameIfExist: aPackageName [
	| p |
	p := RPackageOrganizer default packageNamed: aPackageName ifAbsent: [ ^ self ].
	p removeFromSystem 
]
