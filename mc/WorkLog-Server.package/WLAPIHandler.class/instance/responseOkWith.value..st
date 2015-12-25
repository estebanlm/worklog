private
responseOkWith: keyString value: jsonObject
	^ self toJson: (Dictionary new 
		at: #status put: 'Ok';
		at: keyString put: jsonObject;
		yourself)
