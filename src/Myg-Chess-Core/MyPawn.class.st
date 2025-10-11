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
	
	^(self isWhite and: [ self square file = $8 ])
		or:  [ self color isBlack and: [ self square file = $1 ]].
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'asserting' }
MyPawn >> shouldBePromoted [ 
	
	^ self isPromotable.
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

    | forwardSquares captureSquares |
    
    
    forwardSquares := (self isWhite
        ifTrue: [ { square up } ]
        ifFalse: [ { square down } ]) 
        select: [ :s | s notNil and: [ s hasPiece not ] ].
    
    
    captureSquares := self isWhite
        ifTrue: [ 
            { square up ifNotNil: #left. 
              square up ifNotNil: #right } ]
        ifFalse: [ 
            { square down ifNotNil: #left. 
              square down ifNotNil: #right } ].
    
    captureSquares := captureSquares select: [ :s |
        s notNil and: [ 
            s hasPiece and: [ 
                s contents color ~= color ] ] ].
    
    ^ forwardSquares , captureSquares
]
