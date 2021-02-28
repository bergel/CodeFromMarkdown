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
CodeFromMarkdownPharoAgileVisualization2 >> codeClass [
	^ CFMCodePharo
]

{ #category : #'public - Agile Artificial Intelligence' }
CodeFromMarkdownPharoAgileVisualization2 >> loadAndProduceScripts [
	<script: 'self new loadAndProduceScripts'>

	| path f |
	path := '/Users/alexandrebergel/Desktop/ScriptAAI/'.
	f := path asFileReference.
	f exists ifFalse: [ f createDirectory ].
	context := CFMDoNotExecuteAndProduceScriptContext new.
	context targetFolder: f.
	self 
		chapter01_02_QuickStart;
		chapter01_03_PharoInANutshell;
		chapter01_04_AgileVisualization;
		chapter02_01_Roassal
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
