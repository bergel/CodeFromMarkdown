Class {
	#name : #CFMCode,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#category : #CodeFromMarkdown
}

{ #category : #accessing }
CFMCode >> code [
	^ code
]

{ #category : #accessing }
CFMCode >> code: aString [
	self assert: [ aString notEmpty ].
	code := aString
]

{ #category : #execution }
CFMCode >> install [
	"class definition"

	self lines
		ifEmpty: [ self error: 'Cannot install empty code snippet' ].
	('* subclass: #*' match: self lines first)
		ifTrue: [ [OpalCompiler new
				source: self code;
				evaluate.] on: Exception do: [ :ex | ex inspect. self inspect ].
			^ self ].

	"If is a method definition"
	(self lines first includesSubstring: '>>')
		ifTrue: [ | t classReceiver signature |
			t := self lines first substrings: '>'.
			classReceiver := (t first includes: $ )
				ifTrue: [ (Smalltalk at: (t first substrings: ' ') first asSymbol) class ]
				ifFalse: [ Smalltalk at: t first asSymbol ].
			signature := t second.
			[classReceiver
				compile: (String cr join: {signature} , self lines allButFirst)] on: Exception do: [ :ex | ex inspect. self inspect ] ].

	"simple code snippet -- We execute it in that case"
	OpalCompiler new
		source: self code;
		evaluate
]

{ #category : #accessing }
CFMCode >> lines [
	^ code lines
]
