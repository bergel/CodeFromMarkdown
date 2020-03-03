Class {
	#name : #CFMCleaningContext,
	#superclass : #CFMContext,
	#instVars : [
		'windows'
	],
	#category : #CodeFromMarkdown
}

{ #category : #'as yet unclassified' }
CFMCleaningContext >> afterExecution [
	(self allOpenWindows copyWithoutAll: windows) delete
]

{ #category : #'as yet unclassified' }
CFMCleaningContext >> allOpenWindows [
	^ GLMSystemWindow allInstances , SystemWindow allInstances
]

{ #category : #'as yet unclassified' }
CFMCleaningContext >> beforeExecution [
	windows := self allOpenWindows
]
