Class {
	#name : #CodeFromMarkdown,
	#superclass : #Object,
	#instVars : [
		'extractedCodes'
	],
	#category : #CodeFromMarkdown
}

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

{ #category : #'as yet unclassified' }
CodeFromMarkdown >> processText: aText [

	| isInCode currentCode code |
	isInCode := false.
	currentCode := OrderedCollection new.
	aText lines do: [ :l |
		((l = '```') and: [ isInCode ]) ifTrue: [ isInCode := false. code := CFMCode new code: (String cr join: currentCode). extractedCodes add: code ].	
		isInCode ifTrue: [ 
			currentCode add: l
		].
		(l = '```Smalltalk') ifTrue: [ isInCode := true. currentCode := OrderedCollection new].
	 ]
]
