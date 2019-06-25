Class {
	#name : #CodeToMarkdownTest,
	#superclass : #TestCase,
	#category : #CodeFromMarkdown
}

{ #category : #tests }
CodeToMarkdownTest >> test [

	| cls c s |
	cls := CFMCode.
	c := CodeToMarkdown new.
	c addClass: cls.
	
	s := WriteStream on: String new.
	c writeMarkdownOn: s.
	self assert: s contents equals: '```Smalltalk
Object subclass: #CFMCode
	instanceVariableNames: ''code lineNumber''
	classVariableNames: ''''
	package: ''CodeFromMarkdown''
```

```Smalltalk
CFMCode>>lines
	^ code lines
```

```Smalltalk
CFMCode>>code: aString
	self assert: [ aString notEmpty ].
	code := aString
```

```Smalltalk
CFMCode>>code
	^ code
```

```Smalltalk
CFMCode>>lineNumber
	^ lineNumber
```

```Smalltalk
CFMCode>>lineNumber: anObject
	lineNumber := anObject
```

```Smalltalk
CFMCode>>install
	"class definition"

	self lines
		ifEmpty: [ self error: ''Cannot install empty code snippet'' ].
	(''* subclass: #*'' match: self lines first)
		ifTrue: [ [OpalCompiler new
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

```Smalltalk
CFMCode>>gtInspectorContentsIn: composite
	<gtInspectorPresentationOrder: 5>
	composite text
			title: ''Code'';
			display: [ self code ]
```

'
]
