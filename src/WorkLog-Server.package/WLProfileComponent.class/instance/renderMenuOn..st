rendering
renderMenuOn: html
	html heading level: 3; with: 'See'. 
	html tbsNav: [ 
		html tbsNavItem: [ 
			html anchor 
				callback: [ self root showToday ];
				with: 'Today' ].
		html tbsNavItem: [ 
			html anchor
				callback: [ self root showThisWeek ];
				with: 'This Week' ].
		html tbsNavItem: [ 
			html anchor
				callback: [ self root showThisMonth ];
				with: 'This Month' ]].
	
