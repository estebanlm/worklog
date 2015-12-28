updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self class applicationTitle.
	anHtmlRoot stylesheet
		url: WLStaticLibrary / #styleCss