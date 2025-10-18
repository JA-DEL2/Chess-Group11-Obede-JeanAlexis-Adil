Class {
	#name : 'MyQueen',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyQueen >> renderOnDarkSquare [
    "Return the symbol for this queen on a dark square."
    ^ self isWhite
        ifTrue: [ 'Q' ]   "white queen on dark square"
        ifFalse: [ 'w' ]. "black queen on dark square"
]

{ #category : 'rendering' }
MyQueen >> renderOnLightSquare [
    "Return the symbol for this queen on a light square."
    ^ self isWhite
        ifTrue: [ 'W' ]   "white queen on light square"
        ifFalse: [ 'q' ]. "black queen on light square"
]

{ #category : 'rendering' }
MyQueen >> renderPieceOn: aSquare [

	^ aSquare renderPiece: self
]

{ #category : 'rendering' }
MyQueen >> targetSquaresLegal: aBoolean [

	| likeABishop likeARook |
	likeABishop := (self upRightDiagonalLegal: aBoolean)
	               , (self upLeftDiagonalLegal: aBoolean)
	               , (self downRightDiagonalLegal: aBoolean)
	               , (self downLeftDiagonalLegal: aBoolean).
	likeARook := (self upFileLegal: aBoolean)
	             , (self downFileLegal: aBoolean)
	             , (self leftFileLegal: aBoolean)
	             , (self rightFileLegal: aBoolean).
	^ likeABishop , likeARook
]
