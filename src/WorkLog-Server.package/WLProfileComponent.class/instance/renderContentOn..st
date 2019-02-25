rendering
renderContentOn: html
	html div
		class: 'image';
		with: [ 
			html tbsImage 
				beRounded;
				url: self gravatarUrl ].
	html div
		class: 'full-name';
		with: [
			html heading level: 3; with: self fullName ].
	html div 
		class: 'menu';
		with: [ 
			self renderMenuOn: html ]