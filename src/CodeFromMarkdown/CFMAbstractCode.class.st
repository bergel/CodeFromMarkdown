Class {
	#name : #CFMAbstractCode,
	#superclass : #Object,
	#instVars : [
		'lineNumber',
		'code',
		'context'
	],
	#category : #'CodeFromMarkdown-Core'
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

{ #category : #accessing }
CFMAbstractCode >> context [
	^ context
]

{ #category : #accessing }
CFMAbstractCode >> context: aCFMContext [
	context := aCFMContext
]

{ #category : #'gt inspector' }
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
CFMAbstractCode >> lineNumber: aLineNumber [
	lineNumber := aLineNumber
]

{ #category : #accessing }
CFMAbstractCode >> lines [
	^ code lines
]
