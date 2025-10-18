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
    
    "Conteneur principal"
    container := BlElement new
        layout: (BlLinearLayout vertical cellSpacing: 15);
        background: Color white;
        padding: (BlInsets all: 25);
        geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
        constraintsDo: [ :c |
            c horizontal fitContent.
            c vertical fitContent ];
        yourself.
    
    "Titre"
    container addChild: (BlTextElement new
        text: ('Choose your piece' asRopedText 
            fontSize: 17;
            yourself);
        yourself).
    
    "Boutons avec pièces utilisant la police OpenChess"
    #(
        ('Q Queen' MyQueen)
        ('R Rook' MyRook)
        ('B Bishop' MyBishop)
        ('N Knight' MyKnight)
    ) do: [ :pair |
        | button label |
        
        "Créer un label avec icône OpenChess + texte"
        label := BlElement new
            layout: (BlLinearLayout horizontal cellSpacing: 10);
            constraintsDo: [ :c | 
                c horizontal fitContent.
                c vertical fitContent ];
            yourself.
        
        "Icône de la pièce avec OpenChess font"
        label addChild: (BlTextElement new
            text: (pair first first asString asRopedText
                fontSize: 24;
                fontName: MyOpenChessDownloadedFont new familyName;
                yourself);
            yourself).
        
        "Nom de la pièce"
        label addChild: (BlTextElement new
            text: (pair first allButFirst asRopedText
                fontSize: 16;
                yourself);
            yourself).
        
        button := ToButton new.
        button removeChildren.
        button addChild: label.
        button geometry: (BlRoundedRectangleGeometry cornerRadius: 8).
        button padding: (BlInsets all: 15).
        button constraintsDo: [ :c | c horizontal matchParent ].
        button whenClickedDo: [ 
            closed ifFalse: [
                selectedPiece := pair second.
                closed := true.
                space close.
                semaphore signal ] ].
        container addChild: button ].
    
    "Afficher"
    space := BlSpace new.
    space root addChild: container.
    space title: 'Add Pawn Promotion'.
    space extent: 250@250.
    space show.
    
    "Surveiller fermeture"
    [ 
        [ space isOpened ] whileTrue: [ (Delay forMilliseconds: 100) wait ].
        closed ifFalse: [ semaphore signal ]
    ] forkAt: Processor userBackgroundPriority.
    
    "Attendre"
    semaphore wait.
    
    ^ selectedPiece new
        color: aPawn color;
        yourself
]
