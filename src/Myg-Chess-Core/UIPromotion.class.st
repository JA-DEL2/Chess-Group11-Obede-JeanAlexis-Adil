Class {
	#name : 'UIPromotion',
	#superclass : 'MyPromotion',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
UIPromotion >> choosePieceFor: aPawn [
      
	"Demande au joueur de choisir la pièce de promotion via une boîte de dialogue"
    | space container selectedPiece |
    selectedPiece := MyQueen.  "Défaut"
    "Créer le conteneur"
    container := BlElement new
        layout: (BlLinearLayout vertical cellSpacing: 15);
        background: Color white;
        padding: (BlInsets all: 30);
        constraintsDo: [ :c |
            c horizontal fitContent.
            c vertical fitContent ];
        yourself.
    "Titre"
    container addChild: (BlTextElement new
        text: ('Choisissez votre piece' asRopedText 
            fontSize: 20;
            yourself);
        yourself).
    "Créer les 4 boutons"
    #(
        ('Reine' MyQueen)
        ('Tour' MyRook)
        ('Fou' MyBishop)
        ('Cavalier' MyKnight)
    ) do: [ :pair |
        | button |
        button := ToButton new
            labelText: pair first;
            yourself.
        button whenClickedDo: [ 
            selectedPiece := pair second.
            space close ].
        container addChild: button ].
    "Créer et afficher la fenêtre"
    space := BlSpace new.
    space root addChild: container.
    space title: 'Promotion du pion'.
    space extent: 300@300.
    space resizable: false.
    space show.
    "Attendre la sélection"
    [ space isOpened ] whileTrue: [ 
        (Delay forMilliseconds: 20) wait ].
    ^ selectedPiece new
        color: aPawn color;
        yourself
]
