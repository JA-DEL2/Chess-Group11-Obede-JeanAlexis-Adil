Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isPromotable [ 
	
	^(self isWhite and: [ self square row = 8 ])
		or:  [ self color isBlack and: [ self square row = 1 ]].
]

{ #category : 'rendering' }
MyPawn >> renderOnDarkSquare [
    "Return the symbol for this pawn when placed on a dark square."
    ^ self isWhite
        ifTrue: [ 'P' ]   "white pawn on dark square"
        ifFalse: [ 'o' ]. "black pawn on dark square"

]

{ #category : 'rendering' }
MyPawn >> renderOnLightSquare [
    "Return the symbol for this pawn when placed on a light square."
    ^ self isWhite
        ifTrue: [ 'O' ]   "white pawn on light square"
        ifFalse: [ 'p' ]. "black pawn on light square"
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPiece: self
]

{ #category : 'asserting' }
MyPawn >> shouldBePromoted [ 
	
	^ self isPromotable.
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [ { square up } ]
		   ifFalse: [ { square down } ]) select: [ :s |
		  s notNil and: [
			  s hasPiece not or: [ s contents color ~= color ] ] ]
]
