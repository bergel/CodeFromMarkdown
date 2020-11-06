Class {
	#name : #CFMCleaningWindowsContext,
	#superclass : #CFMContext,
	#instVars : [
		'windows'
	],
	#category : #'CodeFromMarkdown-Core'
}

{ #category : #'as yet unclassified' }
CFMCleaningWindowsContext >> afterExecution [
	(self allOpenWindows copyWithoutAll: windows) do: [ :w | w delete ]
]

{ #category : #'as yet unclassified' }
CFMCleaningWindowsContext >> allOpenWindows [
	^ GLMSystemWindow allInstances , SystemWindow allInstances
]

{ #category : #'as yet unclassified' }
CFMCleaningWindowsContext >> beforeExecution [
	windows := self allOpenWindows
]
