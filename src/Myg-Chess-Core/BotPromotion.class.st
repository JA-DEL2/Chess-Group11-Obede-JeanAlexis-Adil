Class {
	#name : 'BotPromotion',
	#superclass : 'MyPromotion',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
BotPromotion >> choosePieceFor: aPawn [

	^ MyQueen new
		color: aPawn color;
			yourself
]
