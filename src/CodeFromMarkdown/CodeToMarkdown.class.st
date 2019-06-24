Class {
	#name : #CodeToMarkdown,
	#superclass : #Object,
	#instVars : [
		'classesToExtract'
	],
	#category : #CodeFromMarkdown
}

{ #category : #'public - adding' }
CodeToMarkdown >> addClass: aClass [
	classesToExtract add: aClass 
]

{ #category : #private }
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

{ #category : #private }
CodeToMarkdown >> writeClass: cls ToMarkdownOn: stream [
	self encloseToMarkdown: cls definition on: stream
]

{ #category : #private }
CodeToMarkdown >> writeCompiledMethod: cm ToMarkdownOn: stream [
	| source |
	source := cm methodClass name, '>>', cm sourceCode.
	self encloseToMarkdown: source on: stream
]

{ #category : #'public - generating' }
CodeToMarkdown >> writeMarkdown: aFileName [
	"
	| c |
	c := CodeToMarkdown new.
	c addClass: GARobot.
	c addClass: GARobotMap.
	c writeMarkdown: '/Users/alexandrebergel/Dropbox/Workspace/Books/AgileArtificialIntelligence.github.io/book/13-Robot/13-Robot.markdown'
	"
	self writeMarkdownOn: aFileName asFileReference writeStream
]

{ #category : #'public - generating' }
CodeToMarkdown >> writeMarkdownOn: stream [

	classesToExtract do: [ :cls |
		self writeClass: cls ToMarkdownOn: stream.
		cls methods, cls class methods do: [ :cm |
			self writeCompiledMethod: cm ToMarkdownOn: stream. ]
	]
]
