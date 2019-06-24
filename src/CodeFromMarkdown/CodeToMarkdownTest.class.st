Class {
	#name : #CodeToMarkdownTest,
	#superclass : #TestCase,
	#category : #CodeFromMarkdown
}

{ #category : #tests }
CodeToMarkdownTest >> test [

	| cls c s |
	cls := Announcer.
	c := CodeToMarkdown new.
	c addClass: cls.
	
	s := WriteStream on: String new.
	c writeMarkdownOn: s.
	self assert: s contents equals: '```Smalltalk
Object subclass: #Announcer
	instanceVariableNames: ''registry''
	classVariableNames: ''''
	package: ''Announcements-Core-Base''
```

```Smalltalk
Announcer>>subscriptions

	^ registry
```

```Smalltalk
Announcer>>unsubscribe: anObject
	"Unsubscribe all subscriptions of anObject from the receiver"
	
	registry removeSubscriber: anObject
```

```Smalltalk
Announcer>>weak
	"announcer weak subscribe: foo"
	^ WeakSubscriptionBuilder on: self
```

```Smalltalk
Announcer>>removeSubscription: subscription
	"Remove the given subscription from the receiver"
	
	^ registry remove: subscription

```

```Smalltalk
Announcer>>when: anAnnouncementClass do: aValuable
	"Declare that when anAnnouncementClass is raised, aValuable is executed.  Pay attention that such method as well as #when:do: should not be used on weak announcer since the block holds the receiver and more strongly."
	
	^ registry add: (
		AnnouncementSubscription new 
			announcer: self;
			announcementClass: anAnnouncementClass;
			valuable: aValuable)
	
```

```Smalltalk
Announcer>>handleEventClass: eventClass
	"Return true if the receiver has a callback subscripbed for the event class"
	^ self subscriptions handleEventClass: eventClass
```

```Smalltalk
Announcer>>subscribe: anAnnouncementClass do: aValuable 
	"Declare that when anAnnouncementClass is raised, aValuable is executed."
	
	self
		deprecated: ''Please use #when:do: instead''
		transformWith: ''`@receiver subscribe: `@statements1 do: `@statements2'' 
						-> ''`@receiver when: `@statements1 do: `@statements2''.
	^ self when: anAnnouncementClass do: aValuable
```

```Smalltalk
Announcer>>announce: anAnnouncement

	| announcement |
	announcement := anAnnouncement asAnnouncement.	
	registry ifNotNil: [
		registry deliver: announcement
		].
	^ announcement
```

```Smalltalk
Announcer>>replace: subscription with: newOne
	^ registry replace: subscription with: newOne

```

```Smalltalk
Announcer>>gtInspectorAnnouncementsIn: composite context: aGTContext
	<gtInspectorPresentationOrder: 40>
	| recordedAnnouncements messageSend |
	
	recordedAnnouncements := CollectionValueHolder value: OrderedCollection new.
	messageSend := MessageSend receiver: recordedAnnouncements selector: #addAnnouncementFirst:.
	self
		when: Announcement
		send: #cull:
		to: messageSend.
	aGTContext when: GLMBrowserClosing do: [ self unsubscribe: messageSend ].
	composite table
		title: ''Announcements'';
		display: [ recordedAnnouncements value ];
		column: ''Time'' evaluated: #key;
		column: ''Announcement'' evaluated: #value;
		send: #value;
		showOnly: 50;
		format: #gtDisplayString;
		filterOn: [:text :each | Smalltalk compiler receiver: each; evaluate: ''| date each | date := self key. each := self value. '', text ];
		updateOn: Announcement from: recordedAnnouncements gtAnnouncer;
		act: [ :table | 
			recordedAnnouncements removeAll.
			table update ] 
			icon: GLMUIThemeExtraIcons glamorousCancel 
			entitled: ''Reset''
```

```Smalltalk
Announcer>>subscribe: anAnnouncementClass send: aSelector to: anObject
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector."
	self
		deprecated: ''Please use #when:send:to: instead''
		transformWith: ''`@receiver subscribe: `@statements1 send: `@statements2 to: `@anObject'' 
						-> ''`@receiver when: `@statements1 send: `@statements2 to: `@anObject''.
	^ self when: anAnnouncementClass do: (MessageSend receiver: anObject selector: aSelector)
```

```Smalltalk
Announcer>>hasSubscriber: anObject

	registry subscriptionsOf: anObject do: [:each | ^ true].
	^ false
```

```Smalltalk
Announcer>>basicSubscribe: subscription
	^ registry add: subscription
```

```Smalltalk
Announcer>>when: anAnnouncementClass send: aSelector to: anObject
	"Declare that when anAnnouncementClass is raised, anObject should receive the message aSelector.
    When the message expects one argument (eg #fooAnnouncement:) the announcement is passed as argument.
    When the message expects two arguments (eg #fooAnnouncement:announcer:) both the announcement and the announcer are passed as argument"

	^ self
		when: anAnnouncementClass
		do: (MessageSend receiver: anObject selector: aSelector)
```

```Smalltalk
Announcer>>numberOfSubscriptions
	^ registry numberOfSubscriptions

```

```Smalltalk
Announcer>>when: anAnnouncementClass do: aValuable for: aSubscriber
	"Declare that when anAnnouncementClass is raised, aValuable is executed and define the subscriber."
	
    ^ (self when: anAnnouncementClass do: aValuable) subscriber: aSubscriber; yourself
```

```Smalltalk
Announcer>>gtInspectorSubscriptionsIn: composite
	<gtInspectorPresentationOrder: 30>
	composite table
		title: [ ''Subscriptions'' translated ];
		display: [ self subscriptions glmSubscriptions ];
		when: [ self numberOfSubscriptions isZero not ];
		beMultiple;
		column: ''Subscriber'' evaluated: [ :each | each subscriber asString ];
		column: ''Announcement'' evaluated: [ :each | each announcementClass printString ];
		column: ''Kind'' evaluated: [ :each | each class name ];
		addAction: (GLMGenericAction new
				action: [ :table | self subscriptions reset. table update ]; 
				iconName: #glamorousCancel;
				title: ''Reset All(!)'' translated;
				shouldShowTitle: true);
		selectionAct: [ :table | 
				table selection do: [ :eachSelection | 
					self subscriptions remove: eachSelection ].
				table update ] 
			iconName: #glamorousCancel
			entitled: ''Reset subscription(s)'' translated
```

```Smalltalk
Announcer>>initialize
	super initialize.
	registry := SubscriptionRegistry new.
```

```Smalltalk
Announcer class>>gtExampleEmptyAnnouncer
	<gtExample>
	<label: ''Empty Announcer''>
	
	^ self new
```

```Smalltalk
Announcer class>>gtExampleSystemAnnouncer
	<gtExample>
	<label: ''System Announcer''>
	
	^ SystemAnnouncer uniqueInstance
```

'
]
