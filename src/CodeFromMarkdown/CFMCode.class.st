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
	self lines
		ifEmpty: [ self error: 'Cannot install empty code snippet' ].
	('* subclass: #*' match: self lines first)
		ifTrue: [ OpalCompiler new
				source: self code;
				evaluate.
			^ self ].
	
	self assert: [ self lines first includesSubstring: '>>' ] description: 'Wrong code definition'.
	(self lines first includesSubstring: '>>' ) ifTrue: [ 
		| t classReceiver signature |
		t := self lines first substrings: '>'.
		
		classReceiver :=(t first includes: $ ) 
			ifTrue: [ (Smalltalk at: (t first substrings: ' ') first asSymbol) class ]
			ifFalse: [ Smalltalk at: t first asSymbol ].
		signature := t second.
		classReceiver compile: (String cr join: { signature }, self lines allButFirst)
	].
]

{ #category : #accessing }
CFMCode >> lines [
	^ code lines
]
