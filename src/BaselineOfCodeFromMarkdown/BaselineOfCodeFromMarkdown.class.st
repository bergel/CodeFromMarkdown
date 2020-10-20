Class {
	#name : #BaselineOfCodeFromMarkdown,
	#superclass : #BaselineOf,
	#category : #BaselineOfCodeFromMarkdown
}

{ #category : #baselines }
BaselineOfCodeFromMarkdown >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'CodeFromMarkdown' ]
]
