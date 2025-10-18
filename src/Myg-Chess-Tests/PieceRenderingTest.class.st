Class {
	#name : 'PieceRenderingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
PieceRenderingTest >> testBishopRendering [
    | darkSquare lightSquare whiteBishop blackBishop |
    darkSquare := MyChessSquare new.
    darkSquare color: Color black.
    lightSquare := MyChessSquare new.
    lightSquare color: Color white.

    whiteBishop := MyBishop white.
    blackBishop := MyBishop black.

    self assert: (darkSquare renderPiece: whiteBishop) equals: 'B'.
    self assert: (darkSquare renderPiece: blackBishop) equals: 'V'.
    self assert: (lightSquare renderPiece: whiteBishop) equals: 'b'.
    self assert: (lightSquare renderPiece: blackBishop) equals: 'v'.
]

{ #category : 'tests' }
PieceRenderingTest >> testKingRendering [
    | darkSquare lightSquare whiteKing blackKing |
    darkSquare := MyChessSquare new.
    darkSquare color: Color black.
    lightSquare := MyChessSquare new.
    lightSquare color: Color white.

    whiteKing := MyKing white.
    blackKing := MyKing black.

    self assert: (darkSquare renderPiece: whiteKing) equals: 'K'.
    self assert: (darkSquare renderPiece: blackKing) equals: 'L'.
    self assert: (lightSquare renderPiece: whiteKing) equals: 'k'.
    self assert: (lightSquare renderPiece: blackKing) equals: 'l'.
]

{ #category : 'tests' }
PieceRenderingTest >> testKnightRendering [
    | dark light whiteN blackN |
    dark := MyChessSquare new color: Color black; yourself.
    light := MyChessSquare new color: Color white; yourself.
    whiteN := MyKnight white.
    blackN := MyKnight black.
    self assert: (dark renderPiece: whiteN) equals: 'N'.
    self assert: (dark renderPiece: blackN) equals: 'm'.
    self assert: (light renderPiece: whiteN) equals: 'M'.
    self assert: (light renderPiece: blackN) equals: 'n'.
]

{ #category : 'tests' }
PieceRenderingTest >> testPawnRendering [
    | dark light whiteP blackP |
    dark := MyChessSquare new color: Color black; yourself.
    light := MyChessSquare new color: Color white; yourself.
    whiteP := MyPawn white.
    blackP := MyPawn black.
    self assert: (dark renderPiece: whiteP) equals: 'P'.
    self assert: (dark renderPiece: blackP) equals: 'o'.
    self assert: (light renderPiece: whiteP) equals: 'O'.
    self assert: (light renderPiece: blackP) equals: 'p'.
]

{ #category : 'tests' }
PieceRenderingTest >> testQueenRendering [
    | dark light whiteQ blackQ |
    dark := MyChessSquare new color: Color black; yourself.
    light := MyChessSquare new color: Color white; yourself.
    whiteQ := MyQueen white.
    blackQ := MyQueen black.
    self assert: (dark renderPiece: whiteQ) equals: 'Q'.
    self assert: (dark renderPiece: blackQ) equals: 'w'.
    self assert: (light renderPiece: whiteQ) equals: 'W'.
    self assert: (light renderPiece: blackQ) equals: 'q'.
]

{ #category : 'tests' }
PieceRenderingTest >> testRookRendering [
    | darkSquare lightSquare whiteRook blackRook |
    darkSquare := MyChessSquare new.
    darkSquare color: Color black.
    lightSquare := MyChessSquare new.
    lightSquare color: Color white.

    whiteRook := MyRook white.
    blackRook := MyRook black.

    self assert: (darkSquare renderPiece: whiteRook) equals: 'R'.
    self assert: (darkSquare renderPiece: blackRook) equals: 't'.
    self assert: (lightSquare renderPiece: whiteRook) equals: 'T'.
    self assert: (lightSquare renderPiece: blackRook) equals: 'r'.
]
