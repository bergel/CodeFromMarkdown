Class {
	#name : #CodeFromMarkdownPharo,
	#superclass : #AbstractCodeFromMarkdown,
	#category : #CodeFromMarkdown
}

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter04neuralNetwork [
	<script: 'self new chapter04neuralNetwork'>
	
	self removePackageNameIfExist: 'NeuralNetwork'.
	
	(self processFileName: '02-Perceptron/02-chapter2.markdown') install.
	(self processFileName: '03-Neuron/03-chapter3.markdown') install.
	(self processFileName: '04-NeuralNetwork/04-chapter.markdown') install.
	
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter06neuralNetwork [
	<script: 'self new chapter06neuralNetwork'>
	
	(self processFileName: '06-Data/06-Data.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter08matrixAndMatrixLib [
	<script: 'self new matrixAndMatrixLib'>
	
	self removePackageNameIfExist: 'Matrix'.
	self removePackageNameIfExist: 'NeuralNetwork-Matrix'.
	
	(self processFileName: '07-MatrixLibrary/07-MatrixLibrary.markdown') install.
	(self processFileName: '08-MatrixNN/08-MatrixNN.markdown') install.
	
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter12geneticAlgo [
	<script: 'self new chapter12geneticAlgo'>
	
	self removePackageNameIfExist: 'GeneticAlgorithm'.
	
	(self processFileName: '10-GeneticAlgorithm/10-GeneticAlgorithm.markdown') install.
	(self processFileName: '11-GAExamples/11-GAExamples.markdown') install.
	(self processFileName: '12-TravelingSalesmanProblem/12-TravelingSalesmanProblem.markdown') install.



]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter13robot [
	<script: 'self new chapter13robot'>
	self removePackageNameIfExist: 'Robot'.
	
	(self processFileName: '13-Robot/13-Robot.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter15creature [
	<script: 'self new chapter15creature'>
	self removePackageNameIfExist: 'Creature'.
	
	(self processFileName: '14-Zoomorphic/14-Zoomorphic.markdown') install.
	(self processFileName: '15-ZoomorphicSimulation/15-ZoomorphicSimulation.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter16neuroevolution [
	<script: 'self new chapter16neuroevolution'>
	
	"self removePackageNameIfExist: 'NeuralNetwork'."
	
	(self processFileName: '16-Neuroevolution/16-Neuroevolution.markdown') install.

]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter17NEAT [
	<script: 'self new chapter17NEAT'>
	
	self removePackageNameIfExist: 'NEAT'; removePackageNameIfExist: 'MiniMario'.
	
	(self processFileName: '17-NEAT/17-NEAT.markdown') install.
	(self processFileName: '18-MarioGame/18-MarioGame.markdown') install.
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> chapter18pongGame [
	<script: 'self new chapter18pongGame'>
	
	"self removePackageNameIfExist: 'NeuralNetwork'."
	
	(self processFileName: '18-PongGame/18-PongGame.markdown') install.

]

{ #category : #public }
CodeFromMarkdownPharo >> codeClass [
	^ CFMCodePharo
]

{ #category : #public }
CodeFromMarkdownPharo >> markdownCodeKeyword [
	^ 'Smalltalk'
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> removePackageNameIfExist: aPackageName [
	| p |
	p := RPackageOrganizer default packageNamed: aPackageName ifAbsent: [ ^ self ].
	p removeFromSystem 
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> roassal2 [
	"Load Roassal2 from local hard disk"

	<script: 'self new roassal2'>
	Metacello new
		baseline: 'Roassal2';
		repository: 'gitlocal:///Users/alexandrebergel/Dropbox/GitRepos/Roassal2';
		lock;
		load
]

{ #category : #public }
CodeFromMarkdownPharo >> rootFolderName [
	"Root folder of where the book is located. Note that it ends with /"
	^ '/Users/alexandrebergel/Dropbox/Workspace/AgileArtificialIntelligence/book/'
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharo >> tictactoe [
	<script: 'self new tictactoe'>
	self removePackageNameIfExist: 'TicTacToe'.
	
	(self processFileName: '/Users/alexandrebergel/Dropbox/Workspace/AgileArtificialIntelligence/book/XX-TicTacToe/17-TicTacToe.markdown') install.

]
