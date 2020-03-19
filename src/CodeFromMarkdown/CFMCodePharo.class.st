Class {
	#name : #CFMCodePharo,
	#superclass : #CFMAbstractCode,
	#category : #CodeFromMarkdown
}

{ #category : #execution }
CFMCodePharo >> install [
	"class definition"

	self lines
		ifEmpty: [ self error: 'Cannot install empty code snippet' ].
		
	"If this is a class definition"
	('* subclass: #*' match: self lines first)
		ifTrue: [ 
			self assert: [ ('*category*' match: self lines last) not ] description: 'Should use the new syntax of class definition!'.
			[ OpalCompiler new
				source: self code;
				evaluate.] on: SyntaxErrorNotification do: [ :ex | ex inspect. self inspect ].
			^ self ].

	"If is a method definition"
	(self lines first includesSubstring: '>>')
		ifTrue: [ | t classReceiver signature |
			t := self lines first substrings: '>'.
			classReceiver := (t first includes: $ )
				ifTrue: [ (Smalltalk at: (t first substrings: ' ') first asSymbol) class ]
				ifFalse: [ Smalltalk at: t first asSymbol ].
			classReceiver ifNil: [ self error: 'Wrong class name' ].
			(t size = 1) ifTrue: [ "Could happen if there is no symbol, e.g., empty template". ^ self ].
			signature := t second.
			[classReceiver
				compile: (String cr join: {signature} , self lines allButFirst)] on: SyntaxErrorNotification do: [ :ex | ex inspect. self inspect ].
			
			((classReceiver inheritsFrom: TestCase) and: [ signature beginsWith: 'test' ])
				ifTrue: [ classReceiver debug: signature ].
			^ self ].

	"Do nothing if asked to load Roassal"
	self code = 'Metacello new
    baseline: ''Roassal2'';
    repository: ''github://ObjectProfile/Roassal2/src'';
    load.' ifTrue: [ ^ self  ].


	"simple code snippet -- We execute it in that case"
	context shouldExecuteScripts ifTrue: [
		OpalCompiler new
			source: self code;
			evaluate ].
	
	context shouldSaveScriptInFile ifTrue: [ 
		(context targetFolder / (context processedFileName, '.txt')) writeStream
			nextPutAll: '-----------------------------';
			lf;
			nextPutAll: self code;
			close
	]
]
