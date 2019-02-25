"
I'm a youtube link.
"
Class {
	#name : #WLYouTubeLink,
	#superclass : #WLExternalLink,
	#category : 'WorkLog-Server-Model-Link'
}

{ #category : #testing }
WLYouTubeLink class >> isSuitableFor: aLink [
	^ aLink reference includesSubstring: 'youtube.com'
]

{ #category : #private }
WLYouTubeLink >> extractYoutubeIdFromUrl [
	^ (self url copyAfter: $?) copyAfter: $=
]

{ #category : #accessing }
WLYouTubeLink >> thumbnailUrl [
	^ ('http://img.youtube.com/vi/{1}/default.jpg' format: { self extractYoutubeIdFromUrl })
]

{ #category : #accessing }
WLYouTubeLink >> title [
	^ 'YouTube'
]
