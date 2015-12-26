rendering
renderHeaderOn: html
 	html tbsNavbar beDefault with: [
		html tbsNavbarBrand
			url: '#';
			with: 'Esteban''s log'.
			
		"html tbsNav beNavbarNavigation; with: [ 
			html tbsNavItem: [ html anchor callback: [ self showToday ]; with: 'Today' ].
			html tbsNavItem: [ html anchor callback: [ self showThisWeek ]; with: 'This Week' ].
			html tbsNavItem: [ html anchor callback: [ self showThisMonth ]; with: 'This Month' ]]"].
