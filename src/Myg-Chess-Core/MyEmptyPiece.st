Class {
	#name : 'MyEmptyPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'rendering' }
MyEmptyPiece >> renderPieceOn: aSquare [

	^ aSquare renderEmptyPiece: self
]

{ #category : 'rendering' }
MyEmptyPiece >> targetSquaresLegal: aBoolean [

	^ OrderedCollection new
]

{ #category : 'testing' }
MyEmptyPiece >> isPiece [
	
	^ false
]