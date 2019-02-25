"
I'm the entry point to WorkLog app.
"
Class {
	#name : #WLApplicationComponent,
	#superclass : #WLBookmarkComponent,
	#instVars : [
		'profileComponent'
	],
	#classInstVars : [
		'production'
	],
	#category : 'WorkLog-Server-View'
}

{ #category : #accessing }
WLApplicationComponent class >> applicationHeader [
	^ WLServerConfiguration uniqueInstance header 
		ifNil: [ self applicationTitle ].
]

{ #category : #accessing }
WLApplicationComponent class >> applicationPath [
	^ 'web'
]

{ #category : #accessing }
WLApplicationComponent class >> applicationTitle [
	^ WLServerConfiguration uniqueInstance title ifNil: [ 
		WLServerConfiguration uniqueInstance user fullName , '''s log' ]
]

{ #category : #'class initialization' }
WLApplicationComponent class >> initialize [
	SessionManager default registerUserClassNamed: self name.
	self registerApplication.
]

{ #category : #testing }
WLApplicationComponent class >> isProduction [
	| config |
	production
		ifNil:
			[ 
				config := WLServerConfiguration uniqueInstance.
				config production
					ifNotNil: [ production := config production ]
					ifNil: [ production := false ] ].
	^ production
]

{ #category : #accessing }
WLApplicationComponent class >> prepareForDevelopment [
	production := false.
	self resetDatabase.
]

{ #category : #accessing }
WLApplicationComponent class >> prepareForProduction [
	production := true.
	self resetDatabase
]

{ #category : #private }
WLApplicationComponent class >> registerApplication [
	| app | 
	app := WAAdmin register: self asApplicationAt: self applicationPath.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary
]

{ #category : #private }
WLApplicationComponent class >> resetDatabase [
	self isProduction 
		ifTrue: [ self resetDatabaseForProduction ]
		ifFalse: [ self resetDatabaseForDevelopment ]
]

{ #category : #private }
WLApplicationComponent class >> resetDatabaseForDevelopment [
	VOMemoryRepository new enableSingleton
]

{ #category : #private }
WLApplicationComponent class >> resetDatabaseForProduction [
	| config |
	config := WLServerConfiguration uniqueInstance.
	(VOMongoRepository 
		host: config host 
		port: (config port ifNil: [ VOMongoRepository defaultPort ])
		database: config database)
		enableSingleton
]

{ #category : #'system startup' }
WLApplicationComponent class >> startUp: resuming [
	resuming ifFalse: [ ^ self ].
	WLServerConfiguration installFromFileSystem.
	self resetDatabase.
]

{ #category : #hooks }
WLApplicationComponent >> children [ 
	^ super children, { profileComponent }
]

{ #category : #factory }
WLApplicationComponent >> createSearchComponentFrom: fromDate to: toDate [
	^ WLSearchPostListComponent from: fromDate to: toDate
]

{ #category : #factory }
WLApplicationComponent >> createThisMonthComponent [
	^ WLThisMonthPostListComponent new
]

{ #category : #factory }
WLApplicationComponent >> createThisWeekComponent [ 
	^ WLThisWeekPostListComponent new
]

{ #category : #factory }
WLApplicationComponent >> createTodayComponent [
	^ WLTodayPostListComponent new
]

{ #category : #accessing }
WLApplicationComponent >> defaultContentComponent [ 
	^ self createTodayComponent
]

{ #category : #initialization }
WLApplicationComponent >> initialize [ 
	super initialize.
	profileComponent := WLProfileComponent root: self.
]

{ #category : #routes }
WLApplicationComponent >> month [
	<get>
	<path: '/month'>
	
	^ self createThisMonthComponent
]

{ #category : #routes }
WLApplicationComponent >> post: idString [
	<get>
	<path: '/post/{idString}'>
	| log |
	log := (WLLog findByPermaLink: idString asNumber) ifNil: [ ^ nil ].
	^ WLDisqusPostComponent post: log
]

{ #category : #rendering }
WLApplicationComponent >> renderContentOn: html [
	self renderHeaderOn: html.
	html tbsContainerFluid: [
		html tbsRow "showGrid; "with: [ 
			html tbsColumn 
				mediumSize: 2;
				mediumOffset: 2;
				with: profileComponent.
			html tbsColumn 
				mediumSize: 6;
				with: [ super renderContentOn: html ] ].
		html tbsRow "showGrid; "with: [
			html tbsColumn 
				mediumSize: 8;
				mediumOffset: 2;
				with: [ self renderFooterOn: html ]] ].
		
	html html: ('<script id="dsq-count-scr" src="//{1}.disqus.com/count.js" async></script>' format: { WLServerConfiguration uniqueInstance disqusAccount })
]

{ #category : #rendering }
WLApplicationComponent >> renderFooterOn: html [
	html div 
		class: 'footer';
		with: [
			html span: [ 
				html text: 'Want to stalk me? '.
				html anchor 
					url: '/rss';
					with: 'Suscribe to my rss!' ].
			html break.
			html span: [
				html text: ('Copyright (C) 2015-2016 by {1} - ' format: { WLServerConfiguration uniqueInstance user fullName }).
				html anchor
					target: '_new'; 
					url: 'http://github.com/estebanlm/worklog';
					with: 'Fork me on GitHub']]
]

{ #category : #rendering }
WLApplicationComponent >> renderHeaderOn: html [
 	html tbsNavbar beDefault with: [
		html tbsNavbarBrand
			callback: [ self showToday ];
			with: WLApplicationComponent applicationHeader.
			
		"html tbsNav beNavbarNavigation; with: [ 
			html tbsNavItem: [ html anchor callback: [ self showToday ]; with: 'Today' ].
			html tbsNavItem: [ html anchor callback: [ self showThisWeek ]; with: 'This Week' ].
			html tbsNavItem: [ html anchor callback: [ self showThisMonth ]; with: 'This Month' ]]"].

]

{ #category : #routes }
WLApplicationComponent >> root [
	<get>
	<path: '/'>
	
	^ self today
]

{ #category : #routes }
WLApplicationComponent >> searchFrom: fromString to: toString [
	<get>
	<path: '/search?from={fromString}&to={toString}'>
	
	^ self createSearchComponentFrom: fromString asDateDMY to: toString asDateDMY
]

{ #category : #actions }
WLApplicationComponent >> showThisMonth [
	self content: self createThisMonthComponent
]

{ #category : #actions }
WLApplicationComponent >> showThisWeek [
	self content: self createThisWeekComponent
]

{ #category : #actions }
WLApplicationComponent >> showToday [
	self content: self createTodayComponent
]

{ #category : #private }
WLApplicationComponent >> sortLogs: aCollection [
	^ aCollection sorted: [ :a :b | b date < a date ]
]

{ #category : #routes }
WLApplicationComponent >> today [
	<get>
	<path: '/today'>
	
	^ self createTodayComponent
]

{ #category : #updating }
WLApplicationComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self class applicationTitle.
	anHtmlRoot stylesheet
		url: WLStaticLibrary / #styleCss.
	anHtmlRoot stylesheet 
		url: TBSDeploymentLibrary / #cssbootstrapminCss.
	anHtmlRoot stylesheet 
		url: TBSDeploymentLibrary / #cssbootstrapthememinCss.
]

{ #category : #routes }
WLApplicationComponent >> week [
	<get>
	<path: '/week'>
	
	^ self createThisWeekComponent
]
