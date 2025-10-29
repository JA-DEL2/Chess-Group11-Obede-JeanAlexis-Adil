Class {
	#name : 'MyPromotionTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPromotionTest >> testBotPromotionCreatesQueenWithCorrectColor [
    | board pawn square promotion |
    board := MyChessBoard empty.
    board at: 'd8' put: (pawn := MyPawn white).
    square := board at: 'd8'.
    
    promotion := BotPromotion new.
    promotion promoteAsync: pawn inGame: nil.
    
    self assert: square contents class equals: MyQueen.
    self assert: square contents color equals: Color white.
]

{ #category : 'tests' }
MyPromotionTest >> testBotPromotionForBlackPawn [
    | board pawn square promotion |
    board := MyChessBoard empty.
    board at: 'h1' put: (pawn := MyPawn black).
    square := board at: 'h1'.
    
    promotion := BotPromotion new.
    promotion promoteAsync: pawn inGame: nil.
    
    self assert: square contents class equals: MyQueen.
    self assert: square contents color equals: Color black.
]
