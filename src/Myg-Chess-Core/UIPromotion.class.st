Class {
	#name : 'UIPromotion',
	#superclass : 'MyPromotion',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
UIPromotion >> choosePieceFor: aPawn [
   "Demande au joueur de choisir la pièce de promotion"
    
    | space container selectedPiece semaphore closed |
    
    selectedPiece := MyQueen.
    semaphore := Semaphore new.
    closed := false.
    
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
        text: ('Choisissez votre pièce' asRopedText 
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
            closed ifFalse: [
                selectedPiece := pair second.
                closed := true.
                space close.
                semaphore signal ] ].
        container addChild: button ].
    
    "Créer et afficher"
    space := BlSpace new.
    space root addChild: container.
    space title: 'Promotion du pion'.
    space extent: 300@300.
    space resizable: false.
    space show.
    
    "Surveiller la fermeture en arrière-plan"
    [ 
        [ space isOpened ] whileTrue: [ 
            (Delay forMilliseconds: 100) wait ].
        closed ifFalse: [ semaphore signal ]
    ] forkAt: Processor userBackgroundPriority.
    
    "Attendre le signal"
    semaphore wait.
    
    ^ selectedPiece new
        color: aPawn color;
        yourself
]
