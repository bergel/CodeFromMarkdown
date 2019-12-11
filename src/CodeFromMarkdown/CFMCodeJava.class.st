Class {
	#name : #CFMCodeJava,
	#superclass : #CFMAbstractCode,
	#category : #CodeFromMarkdown
}

{ #category : #actions }
CFMCodeJava >> install [
	| path isThereAClassDefinition className file shouldAppend |
	path := '/Users/alexandrebergel/Desktop/AAIJava'.
	shouldAppend := false.
	"isThereAPackageDefinition := code lines anySatisfy: [ :l | l beginsWith: 'package ' ]."

	isThereAClassDefinition := code lines anySatisfy: [ :l | l beginsWith: 'public class ' ].
	isThereAClassDefinition ifTrue: [ className := ((code lines detect: [ :l | l beginsWith: 'public class ' ]) substrings: ' ;') third ].
	
	className ifNil: [ 
		(code lines first beginsWith: '//') ifFalse: [ "NOTHING TO DO HERE" ^ self ].
		shouldAppend := true.
		className := (code lines first substrings: ' .;') last ].
	file := path asFileReference / (className, '.java').
	file writeStreamDo: [ :str | 
		shouldAppend ifTrue: [ str setToEnd ].
		str nextPutAll: code ]
	
]
