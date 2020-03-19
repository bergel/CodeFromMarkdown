Class {
	#name : #CFMContext,
	#superclass : #Object,
	#instVars : [
		'bindings',
		'processedFileName'
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

{ #category : #accessing }
CFMContext >> processedFileName [
	^ processedFileName
]

{ #category : #accessing }
CFMContext >> processedFileName: fileNameAsString [
	"Set the basefilename that is currently being processed"
	processedFileName := fileNameAsString
]

{ #category : #asserting }
CFMContext >> shouldExecuteScripts [
	^ true
]

{ #category : #asserting }
CFMContext >> shouldSaveScriptInFile [
	^ false
]
