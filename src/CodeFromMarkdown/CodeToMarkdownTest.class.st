Class {
	#name : #CodeToMarkdownTest,
	#superclass : #TestCase,
	#category : #CodeFromMarkdown
}

{ #category : #tests }
CodeToMarkdownTest >> test [

	| c s |
	c := CodeToMarkdown new.
	c addClass: CFMAbstractCode.
	c addClass: CFMCodePharo.
	
	s := WriteStream on: String new.
	c writeMarkdownOn: s.
	self assert: s contents equals: '```Smalltalk
Object subclass: #CFMAbstractCode
	instanceVariableNames: ''lineNumber code context''
	classVariableNames: ''''
	package: ''CodeFromMarkdown''
```

```Smalltalk
CFMAbstractCode>>code
	^ code
```

```Smalltalk
CFMAbstractCode>>code: aString
	self assert: [ aString notEmpty ].
	code := aString
```

```Smalltalk
CFMAbstractCode>>context
	^ context
```

```Smalltalk
CFMAbstractCode>>context: aCFMContext
	context := aCFMContext
```

```Smalltalk
CFMAbstractCode>>gtInspectorContentsIn: composite
	<gtInspectorPresentationOrder: 5>
	composite text
			title: ''Code'';
			display: [ self code ]
```

```Smalltalk
CFMAbstractCode>>lineNumber
	^ lineNumber
```

```Smalltalk
CFMAbstractCode>>lineNumber: aLineNumber
	lineNumber := aLineNumber
```

```Smalltalk
CFMAbstractCode>>lines
	^ code lines
```

```Smalltalk
CFMAbstractCode subclass: #CFMCodePharo
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''CodeFromMarkdown''
```

```Smalltalk
CFMCodePharo>>install
	"class definition"

	self lines
		ifEmpty: [ self error: ''Cannot install empty code snippet'' ].
		
	"If this is a class definition"
	(''* subclass: #*'' match: self lines first)
		ifTrue: [ 
			self assert: [ (''*category*'' match: self lines last) not ] description: ''Should use the new syntax of class definition!''.
			[ OpalCompiler new
				source: self code;
				evaluate.] on: SyntaxErrorNotification do: [ :ex | ex inspect. self inspect ].
			^ self ].

	"If is a method definition"
	(self lines first includesSubstring: ''>>'')
		ifTrue: [ | t classReceiver signature |
			t := self lines first substrings: ''>''.
			classReceiver := (t first includes: $ )
				ifTrue: [ (Smalltalk at: (t first substrings: '' '') first asSymbol) class ]
				ifFalse: [ Smalltalk at: t first asSymbol ].
			classReceiver ifNil: [ self error: ''Wrong class name'' ].
			(t size = 1) ifTrue: [ "Could happen if there is no symbol, e.g., empty template". ^ self ].
			signature := t second.
			[classReceiver
				compile: (String cr join: {signature} , self lines allButFirst)] on: SyntaxErrorNotification do: [ :ex | ex inspect. self inspect ].
			
			((classReceiver inheritsFrom: TestCase) and: [ signature beginsWith: ''test'' ])
				ifTrue: [ classReceiver debug: signature ].
			^ self ].

	"Do nothing if asked to load Roassal"
	self code = ''Metacello new
    baseline: ''''Roassal2'''';
    repository: ''''github://ObjectProfile/Roassal2/src'''';
    load.'' ifTrue: [ ^ self  ].


	"simple code snippet -- We execute it in that case"
	context shouldExecuteScripts ifTrue: [
		OpalCompiler new
			source: self code;
			evaluate ].
	
	context shouldSaveScriptInFile ifTrue: [ 
		(context targetFolder / (context processedFileName, ''.txt'')) writeStream
			setToEnd;
			lf;
			nextPutAll: ''-----------------------------'';
			lf;
			nextPutAll: self code;
			lf;
			close
	]
```

'
]

{ #category : #tests }
CodeToMarkdownTest >> testExtractingFilename [

	| instruction c |
	instruction := '![Knapsack problem (obtained from Wikipedia, authored by Dake, under Creative Commons Attribution-Share Alike 2.5 Generic).](11-GAExamples/figures/knapsack.png){#fig:knapsackExample width=250px}'.
	
	c := CFMCollectPicturesContext new.
	c processImageInstruction: instruction.
	self assert: c filenames size equals: 1.
	self assert: c filenames first equals: '11-GAExamples/figures/knapsack.png'
]

{ #category : #tests }
CodeToMarkdownTest >> testExtractingFilename2 [

	| instruction c |
	instruction := '![MiniMario.](18-MarioGame/figures/miniMario.png){#fig:miniMario width=200px}'.
	
	c := CFMCollectPicturesContext new.
	c processImageInstruction: instruction.
	self assert: c filenames size equals: 1.
	self assert: c filenames first equals: '18-MarioGame/figures/miniMario.png'
]
