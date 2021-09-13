Class {
	#name : #CodeFromMarkdownPharoAgileVisualization2,
	#superclass : #AbstractCodeFromMarkdown,
	#category : #'CodeFromMarkdown-Core'
}

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharoAgileVisualization2 >> allRun [
	<script: 'self new allRun'>

	context := CFMCleaningWindowsContext new.

	self 
		chapter01_01_Introduction;
		chapter01_02_QuickStart;
		chapter01_03_PharoInANutshell;
		chapter01_04_AgileVisualization;
		
		chapter02_01_Roassal
]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter01_01_Introduction [
	<script: 'self new chapter01_01_Introduction'>
	
	(self processFileName: '01-01-Introductiont/01-01-Introduction.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter01_02_QuickStart [
	<script: 'self new chapter01_02_QuickStart'>
	
	(self processFileName: '01-02-QuickStart/01-02-QuickStart.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter01_03_PharoInANutshell [
	<script: 'self new chapter01_03_PharoInANutshell'>
	
	(self processFileName: '01-03-PharoInANutshell/01-03-PharoInANutshell.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter01_04_AgileVisualization [
	<script: 'self new chapter01_04_AgileVisualization'>
	
	(self processFileName: '01-04-AgileVisualization/01-04-AgileVisualization.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_01_Roassal [
	<script: 'self new chapter02_01_Roassal'>
	
	(self processFileName: '02-01-Roassal/02-01-Roassal.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_02_Canvas [
	<script: 'self new chapter02_02_Canvas'>
	
	(self processFileName: '02-02-Canvas/02-02-Canvas.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_03_Shapes [
	<script: 'self new chapter02_03_Shapes'>
	
	(self processFileName: '02-03-Shapes/02-03-Shapes.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_04_LineBuilder [
	<script: 'self new chapter02_04_LineBuilder'>
	
	(self processFileName: '02-04-LineBuilder/02-04-LineBuilder.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_05_ShapeComposition [
	<script: 'self new chapter02_05_ShapeComposition'>
	
	(self processFileName: '02-05-ShapeComposition/02-05-ShapeComposition.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_06_Normalizers [
	<script: 'self new chapter02_06_Normalizers'>
	
	(self processFileName: '02-06-Normalizers/02-06-Normalizers.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_07_Interactions [
	<script: 'self new chapter02_07_Interactions'>
	
	(self processFileName: '02-07-Interactions/02-07-Interactions.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_08_Layouts [
	<script: 'self new chapter02_08_Layouts'>
	
	(self processFileName: '02-08-Layouts/02-08-Layouts.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter02_10_Inspector [
	<script: 'self new chapter02_10_Inspector'>
	
	(self processFileName: '02-10-Inspector/02-10-Inspector.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter03_01_reinforcementlearning [
	<script: 'self new chapter03_01_reinforcementlearning'>
	
	(self processFileName: '03-01-reinforcementlearning/03-01-ReinforcementLearning.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> chapter03_02_continuousDelivery [
	<script: 'self new chapter03_02_continuousDelivery'>
	
	(self processFileName: '03-02-ContinuousIntegration/03-02-ContinuousIntegration.md') install.

]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> codeClass [
	^ CFMCodePharo
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharoAgileVisualization2 >> loadAndProduceScripts [
	<script: 'self new loadAndProduceScripts'>

	| path f |
	"path := '/Users/alexandrebergel/Desktop/ScriptAAI/'."
	path := '/Users/alexandrebergel/Dropbox/GitRepos/AgileVisualizationAPressCode'.
	f := path asFileReference.
	f exists ifFalse: [ f createDirectory ].
	
	(f children select: [ :fl | fl fullName endsWith: '.txt' ]) do: #delete.
	
	context := CFMDoNotExecuteAndProduceScriptContext new.
	context targetFolder: f.
	 
	self 
		chapter01_02_QuickStart;
		chapter01_03_PharoInANutshell;
		chapter01_04_AgileVisualization;
		chapter02_01_Roassal;
		chapter02_02_Canvas;
		chapter02_03_Shapes;
		chapter02_04_LineBuilder;
		chapter02_05_ShapeComposition;
		chapter02_06_Normalizers;
		chapter02_07_Interactions;
		chapter02_08_Layouts;
		chapter03_01_reinforcementlearning
	






]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> markdownCodeKeyword [
	^ 'Smalltalk'
]

{ #category : #public }
CodeFromMarkdownPharoAgileVisualization2 >> rootFolderName [
	"Root folder of where the book is located. Note that it ends with /"
	^ '/Users/alexandrebergel/Dropbox/Workspace/books/AgileVisualizationAPress/book/'
]
