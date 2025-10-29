Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnOnRank1IsPromotable [
    | board pawn |
    board := MyChessBoard empty.
    board at: 'e1' put: (pawn := MyPawn black).
    
    self assert: pawn isPromotable.
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnOnRank8IsPromotable [
    | board pawn |
    board := MyChessBoard empty.
    board at: 'e8' put: (pawn := MyPawn white).
    
    self assert: pawn isPromotable.

]
