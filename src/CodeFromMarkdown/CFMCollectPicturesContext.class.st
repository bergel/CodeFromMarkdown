Class {
	#name : #CFMCollectPicturesContext,
	#superclass : #CFMContext,
	#instVars : [
		'filenames'
	],
	#category : #CodeFromMarkdown
}

{ #category : #'as yet unclassified' }
CFMCollectPicturesContext >> filenames [
	^ filenames
]

{ #category : #initialization }
CFMCollectPicturesContext >> initialize [
	super initialize.
	filenames := OrderedCollection new
]

{ #category : #'as yet unclassified' }
CFMCollectPicturesContext >> processImageInstruction: instruction [
	filenames add: ((instruction substrings: '[]') third substrings: '()') first
]

{ #category : #asserting }
CFMCollectPicturesContext >> shouldExecuteScripts [
	^ false
]

{ #category : #asserting }
CFMCollectPicturesContext >> shouldInstallCode [
	^ false
]
