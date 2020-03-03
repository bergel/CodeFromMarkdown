Class {
	#name : #CFMContext,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #CodeFromMarkdown
}

{ #category : #'as yet unclassified' }
CFMContext >> afterExecution [
]

{ #category : #initialization }
CFMContext >> at: symbol [
	^ bindings at: symbol
]

{ #category : #initialization }
CFMContext >> at: aSymbol ifPresent: aBlock [
	^ bindings at: aSymbol ifPresent: aBlock
]

{ #category : #initialization }
CFMContext >> at: symbol put: anObject [
	bindings at: symbol put: anObject
]

{ #category : #'as yet unclassified' }
CFMContext >> beforeExecution [
]

{ #category : #initialization }
CFMContext >> initialize [
	super initialize.
	bindings := Dictionary new
]
