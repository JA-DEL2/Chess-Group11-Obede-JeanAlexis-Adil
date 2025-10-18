Class {
	#name : 'MyRook',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyRook >> id [
	^ 'R'
]

{ #category : 'rendering' }
MyRook >> renderOnDarkSquare [
    "Return the symbol for this rook on a dark square."
    ^ self isWhite
        ifTrue: [ 'R' ]   "white rook on dark square"
        ifFalse: [ 't' ]. "black rook on dark square"
]

{ #category : 'rendering' }
MyRook >> renderOnLightSquare [
    "Return the symbol for this rook on a light square."
    ^ self isWhite
        ifTrue: [ 'T' ]   "white rook on light square"
        ifFalse: [ 'r' ]. "black rook on light square"
]

{ #category : 'rendering' }
MyRook >> renderPieceOn: aSquare [

	^ aSquare renderPiece: self
]

{ #category : 'rendering' }
MyRook >> targetSquares [

	^ self upFile , self downFile , self leftFile , self rightFile
]

{ #category : 'rendering' }
MyRook >> targetSquaresLegal: aBoolean [

	^ (self upFileLegal: aBoolean) , (self downFileLegal: aBoolean)
	  , (self leftFileLegal: aBoolean) , (self rightFileLegal: aBoolean)
]
