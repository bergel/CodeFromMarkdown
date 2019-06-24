Class {
	#name : #CodeToMarkdown,
	#superclass : #Object,
	#instVars : [
		'classesToExtract'
	],
	#category : #CodeFromMarkdown
}

{ #category : #initialization }
CodeToMarkdown >> addClass: aClass [
	classesToExtract add: aClass 
]

{ #category : #initialization }
CodeToMarkdown >> encloseToMarkdown: code on: stream [
	stream nextPutAll: '```Smalltalk'; cr.
	stream nextPutAll: code.
	stream nextPutAll: '```'; cr; cr.
]

{ #category : #initialization }
CodeToMarkdown >> initialize [
	super initialize.
	classesToExtract := OrderedCollection new
]

{ #category : #initialization }
CodeToMarkdown >> writeClass: cls ToMarkdownOn: stream [
	self encloseToMarkdown: cls definition on: stream
]

{ #category : #initialization }
CodeToMarkdown >> writeCompiledMethod: cm ToMarkdownOn: stream [
	| source |
	source := cm methodClass name, '>>', cm sourceCode.
	self encloseToMarkdown: source on: stream
]

{ #category : #initialization }
CodeToMarkdown >> writeMarkdown: aFileName [

	self writeMarkdownOn: aFileName asFileReference writeStream
]

{ #category : #initialization }
CodeToMarkdown >> writeMarkdownOn: stream [

	classesToExtract do: [ :cls |
		self writeClass: cls ToMarkdownOn: stream.
		cls methods, cls class methods do: [ :cm |
			self writeCompiledMethod: cm ToMarkdownOn: stream. ]
	]
]
