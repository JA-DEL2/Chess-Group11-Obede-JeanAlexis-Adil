Class {
	#name : 'MyKnight',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyKnight >> id [
	
	^ 'N'
]

{ #category : 'rendering' }
MyKnight >> renderOnDarkSquare [
    "Return the symbol for this knight when placed on a dark square."
    ^ self isWhite
        ifTrue: [ 'N' ]   "white knight on dark square"
        ifFalse: [ 'm' ]. "black knight on dark square"
]

{ #category : 'rendering' }
MyKnight >> renderOnLightSquare [
    "Return the symbol for this knight when placed on a light square."
    ^ self isWhite
        ifTrue: [ 'M' ]   "white knight on light square"
        ifFalse: [ 'n' ]. "black knight on light square"
]

{ #category : 'rendering' }
MyKnight >> renderPieceOn: aSquare [

	^ aSquare renderPiece: self
]

{ #category : 'rendering' }
MyKnight >> targetSquaresLegal: aBoolean [

	^ {
		  (square right ifNotNil: [ :p | p right ifNotNil: #up ]).
		  (square right ifNotNil: [ :p | p right ifNotNil: #down ]).
		  (square left ifNotNil: [ :p | p left ifNotNil: #up ]).
		  (square left ifNotNil: [ :p | p left ifNotNil: #down ]).
		  (square up ifNotNil: [ :p | p up ifNotNil: #left ]).
		  (square up ifNotNil: [ :p | p up ifNotNil: #right ]).
		  (square down ifNotNil: [ :p | p down ifNotNil: #left ]).
		  (square down ifNotNil: [ :p | p down ifNotNil: #right ]) }
		  select: [ :s |
			  s notNil and: [ s hasPiece not or: [ s contents color ~= color ] ] ]
]
