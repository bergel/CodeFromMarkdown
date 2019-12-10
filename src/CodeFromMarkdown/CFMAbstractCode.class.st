Class {
	#name : #CFMAbstractCode,
	#superclass : #Object,
	#instVars : [
		'lineNumber',
		'code'
	],
	#category : #CodeFromMarkdown
}

{ #category : #accessing }
CFMAbstractCode >> code [
	^ code
]

{ #category : #accessing }
CFMAbstractCode >> code: aString [
	self assert: [ aString notEmpty ].
	code := aString
]

{ #category : #'as yet unclassified' }
CFMAbstractCode >> gtInspectorContentsIn: composite [
	<gtInspectorPresentationOrder: 5>
	composite text
			title: 'Code';
			display: [ self code ]
]

{ #category : #accessing }
CFMAbstractCode >> lineNumber [
	^ lineNumber
]

{ #category : #accessing }
CFMAbstractCode >> lineNumber: anObject [
	lineNumber := anObject
]

{ #category : #accessing }
CFMAbstractCode >> lines [
	^ code lines
]
