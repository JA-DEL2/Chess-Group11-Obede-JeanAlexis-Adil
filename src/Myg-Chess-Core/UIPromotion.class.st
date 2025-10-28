Class {
	#name : 'UIPromotion',
	#superclass : 'MyPromotion',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
UIPromotion >> promoteAsync: aPawn inGame: aGame [
	 "Afficher la boîte de dialogue et appliquer la promotion au clic"
	    
    | space container |
    
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
    
    
    {
    ('Q Queen' -> MyQueen).
    ('R Rook'  -> MyRook).
    ('B Bishop' -> MyBishop).
    ('N Knight' -> MyKnight)
	} do: [ :pair |
        | button label |
        
        "Label avec icône + texte"
        label := BlElement new
            layout: (BlLinearLayout horizontal cellSpacing: 10);
            constraintsDo: [ :c | 
                c horizontal fitContent.
                c vertical fitContent ];
            yourself.
        
        "Icône OpenChess"
        label addChild: (BlTextElement new
            text: (pair key first asString asRopedText
                fontSize: 24;
                fontName: MyOpenChessDownloadedFont new familyName;
                yourself);
            yourself).
        
        "Nom de la pièce"
        label addChild: (BlTextElement new
            text: (pair key allButFirst asRopedText
                fontSize: 16;
                yourself);
            yourself).
        
        "Créer le bouton"
        button := ToButton new.
        button removeChildren.
        button addChild: label.
        button geometry: (BlRoundedRectangleGeometry cornerRadius: 8).
        button padding: (BlInsets all: 15).
        button constraintsDo: [ :c | c horizontal matchParent ].
        
        "APPLIQUER la promotion au clic"
        button whenClickedDo: [ 
            | newPiece square |
            square := aPawn square.
            newPiece := pair value new.  "pair value contient la CLASSE"
            newPiece color: aPawn color.
            newPiece square: square.
            square contents: newPiece.
            space close ].
        
        container addChild: button ].
    
    "Afficher la fenêtre"
    space := BlSpace new.
    space root addChild: container.
    space title: 'Pawn Promotion'.
    space extent: 250@250.
    space show
]
