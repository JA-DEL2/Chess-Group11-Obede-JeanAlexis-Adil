Class {
	#name : 'MyEmptyPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyEmptyPiece >> isPiece [
	
	^ false
]

{ #category : 'rendering' }
MyEmptyPiece >> renderOnDarkSquare [
    ^ 'x'
]

{ #category : 'rendering' }
MyEmptyPiece >> renderOnLightSquare [
    ^ 'z'
]

{ #category : 'rendering' }
MyEmptyPiece >> renderPieceOn: aSquare [

	^ aSquare renderPiece: self
]

{ #category : 'rendering' }
MyEmptyPiece >> targetSquaresLegal: aBoolean [

	^ OrderedCollection new
]
