Class {
	#name : 'UIPromotion',
	#superclass : 'MyPromotion',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
UIPromotion >> choosePieceFor: aPawn [
    
    | result pieceClasses pieceClass |
    
    pieceClasses := { MyQueen . MyRook . MyBishop . MyKnight }.
    
    result := UIManager default 
        chooseFrom: #('Reine' 'Tour' 'Fou' 'Cavalier')
        values: pieceClasses
        title: 'Choisissez la pièce de promotion'.
    
    result ifNil: [ ^ MyQueen new color: aPawn color; yourself ].
    
    pieceClass := result isInteger 
        ifTrue: [ pieceClasses at: result ]
        ifFalse: [ result ].
    
    ^ pieceClass new
        color: aPawn color;
        yourself
]
