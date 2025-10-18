Class {
	#name : 'MyBishop',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyBishop >> id [
	
	^ 'B'
]

{ #category : 'rendering' }
MyBishop >> renderOnDarkSquare [
	"Return the symbol on a dark square."
    ^ self isWhite
        ifTrue: [ 'B' ]   "white bishop on dark square"
        ifFalse: [ 'V' ]. "black bishop on dark square" 
]

{ #category : 'rendering' }
MyBishop >> renderOnLightSquare [
	"Return the symbol on a light square."
    ^ self isWhite
        ifTrue: [ 'b' ]   "white bishop on light square"
        ifFalse: [ 'v' ]. "black bishop on light square"
]

{ #category : 'rendering' }
MyBishop >> renderPieceOn: aSquare [

	^ aSquare renderPiece: self
]

{ #category : 'rendering' }
MyBishop >> targetSquaresLegal: aBoolean [

	^ (self upRightDiagonalLegal: aBoolean)
	  , (self upLeftDiagonalLegal: aBoolean)
	  , (self downRightDiagonalLegal: aBoolean)
	  , (self downLeftDiagonalLegal: aBoolean)
]
