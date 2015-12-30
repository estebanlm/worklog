rendering
renderContentOn: html
	"html tbsPanel
		beDefault; 
		class: 'post';
		with: [ 
			html tbsPanelBody 
				class: 'text';
				with: [ html html: self post textAsHTML ].
			html tbsPanelFooter
				class: 'date';
				with: self post dateAsHuman ]."
			
	html tbsPanel 
		class: 'post';
		with: [ 
			html div 
				class: 'text';
				with: [ html html: self post textAsHTML ].
			html div 
				class: 'references';
				with: [ self renderReferencesOn: html ].
			html div
				class: 'date';
				with: self post dateAsHuman ].