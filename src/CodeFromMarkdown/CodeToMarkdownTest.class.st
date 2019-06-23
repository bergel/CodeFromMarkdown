Class {
	#name : #CodeToMarkdownTest,
	#superclass : #TestCase,
	#category : #CodeFromMarkdown
}

{ #category : #tests }
CodeToMarkdownTest >> testTest [

	| cls c |
	cls := GTInspectorVariableValuePairsTest.
	c := CodeToMarkdown new.
	c addClass: cls.
	
]
