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
CFMCode >> execute [
]
