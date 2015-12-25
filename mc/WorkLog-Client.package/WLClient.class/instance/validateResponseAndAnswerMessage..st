private
validateResponseAndAnswerMessage: response
	^ (self validateResponse: response) at: #message 		
	