Extension { #name : #PositionableStream }

{ #category : #'*CodeFromMarkdown' }
PositionableStream >> nextString: aString [
	self nextPutAll: (String lf join: aString lines)
]
