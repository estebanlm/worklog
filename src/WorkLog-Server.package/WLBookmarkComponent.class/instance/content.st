accessing
content
	^ content ifNil: [ content := self defaultContentComponent ]