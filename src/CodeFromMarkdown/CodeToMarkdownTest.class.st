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
	instanceVariableNames: ''lineNumber code''
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

	"simple code snippet -- We execute it in that case"
	OpalCompiler new
		source: self code;
		evaluate
```

'
]
