Class {
	#name : 'BotPromotion',
	#superclass : 'MyPromotion',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
BotPromotion >> promoteAsync: aPawn inGame: aGame [
"Promotion automatique instantanée en reine"
    
    | newPiece square |
    square := aPawn square.
    newPiece := MyQueen new.
    newPiece color: aPawn color.
    newPiece square: square.
    square contents: newPiece
]
