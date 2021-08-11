Extension { #name : #ZnEncodedWriteStream }

{ #category : #'*CodeFromMarkdown' }
ZnEncodedWriteStream >> nextString: aString [
	self nextPutAll: (String lf join: aString lines)
]
