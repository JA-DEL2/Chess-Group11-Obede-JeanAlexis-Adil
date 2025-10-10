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
    ^ self isWhite
        ifTrue: [ 'B' ]   "white bishop on dark square"
        ifFalse: [ 'V' ]. "black bishop on dark square"
]

{ #category : 'rendering' }
MyBishop >> renderOnLightSquare [
    ^ self isWhite
        ifTrue: [ 'b' ]   "white bishop on light square"
        ifFalse: [ 'v' ]. "black bishop on light square"
]

{ #category : 'rendering' }
MyBishop >> renderPieceOn: aSquare [

	^ aSquare renderBishop: self
]

{ #category : 'rendering' }
MyBishop >> targetSquaresLegal: aBoolean [

	^ (self upRightDiagonalLegal: aBoolean)
	  , (self upLeftDiagonalLegal: aBoolean)
	  , (self downRightDiagonalLegal: aBoolean)
	  , (self downLeftDiagonalLegal: aBoolean)
]
