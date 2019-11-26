Class {
	#name : #CodeFromMarkdown,
	#superclass : #Object,
	#instVars : [
		'extractedCodes'
	],
	#category : #CodeFromMarkdown
}

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter04neuralNetwork [
	<script: 'self new chapter04neuralNetwork'>
	
	self removePackageNameIfExist: 'NeuralNetwork'.
	
	(self processFileName: '02-Perceptron/02-chapter2.markdown') install.
	(self processFileName: '03-Neuron/03-chapter3.markdown') install.
	(self processFileName: '04-NeuralNetwork/04-chapter.markdown') install.
	
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter06neuralNetwork [
	<script: 'self new chapter06neuralNetwork'>
	
	(self processFileName: '06-Data/06-Data.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter08matrixAndMatrixLib [
	<script: 'self new matrixAndMatrixLib'>
	
	self removePackageNameIfExist: 'Matrix'.
	self removePackageNameIfExist: 'NeuralNetwork-Matrix'.
	
	(self processFileName: '07-MatrixLibrary/07-MatrixLibrary.markdown') install.
	(self processFileName: '08-MatrixNN/08-MatrixNN.markdown') install.
	
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter12geneticAlgo [
	<script: 'self new chapter12geneticAlgo'>
	
	self removePackageNameIfExist: 'GeneticAlgorithm'.
	
	(self processFileName: '10-GeneticAlgorithm/10-GeneticAlgorithm.markdown') install.
	(self processFileName: '11-GAExamples/11-GAExamples.markdown') install.
	(self processFileName: '12-TravelingSalesmanProblem/12-TravelingSalesmanProblem.markdown') install.



]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter13robot [
	<script: 'self new chapter13robot'>
	self removePackageNameIfExist: 'Robot'.
	
	(self processFileName: '13-Robot/13-Robot.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter15creature [
	<script: 'self new chapter15creature'>
	self removePackageNameIfExist: 'Creature'.
	
	(self processFileName: '14-Zoomorphic/14-Zoomorphic.markdown') install.
	(self processFileName: '15-ZoomorphicSimulation/15-ZoomorphicSimulation.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter16neuroevolution [
	<script: 'self new chapter16neuroevolution'>
	
	"self removePackageNameIfExist: 'NeuralNetwork'."
	
	(self processFileName: '16-Neuroevolution/16-Neuroevolution.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> chapter17pongGame [
	<script: 'self new chapter17pongGame'>
	
	"self removePackageNameIfExist: 'NeuralNetwork'."
	
	(self processFileName: '17-PongGame/17-PongGame.markdown') install.

]

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
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/07-MatrixLibrary/07-Matrix.markdown') install.
	(self new processFileName: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/08-MatrixNN/08-MatrixNN.markdown') install.
	"
	"Check if the filename is absolute. If not, then we prepend the rootFolder"
	| t |
	t := (aFilename beginsWith: '/') ifTrue: [ aFilename ] ifFalse: [ self rootFolderName, aFilename ].
	self processText: t asFileReference contents
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

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> roassal2 [
	"Load Roassal2 from local hard disk"

	<script: 'self new roassal2'>
	Metacello new
		baseline: 'Roassal2';
		repository: 'gitlocal:///Users/alexandrebergel/Dropbox/GitRepos/Roassal2';
		lock;
		load
]

{ #category : #public }
CodeFromMarkdown >> rootFolderName [
	"Root folder of where the book is located. Note that it ends with /"
	^ '/Users/alexandrebergel/Dropbox/Workspace/AgileArtificialIntelligence/book/'
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdown >> tictactoe [
	<script: 'self new tictactoe'>
	self removePackageNameIfExist: 'TicTacToe'.
	
	(self processFileName: '/Users/alexandrebergel/Dropbox/Workspace/AgileArtificialIntelligence/book/XX-TicTacToe/17-TicTacToe.markdown') install.

]
