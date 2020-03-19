Class {
	#name : #CFMDoNotExecuteAndProduceScriptContext,
	#superclass : #CFMContext,
	#instVars : [
		'windows',
		'targetFolder'
	],
	#category : #CodeFromMarkdown
}

{ #category : #asserting }
CFMDoNotExecuteAndProduceScriptContext >> shouldExecuteScripts [
	^ false
]

{ #category : #asserting }
CFMDoNotExecuteAndProduceScriptContext >> shouldSaveScriptInFile [
	^ true
	
]

{ #category : #accessing }
CFMDoNotExecuteAndProduceScriptContext >> targetFolder [
	^ targetFolder
]

{ #category : #accessing }
CFMDoNotExecuteAndProduceScriptContext >> targetFolder: aFileReference [
	targetFolder := aFileReference
]
