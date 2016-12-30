CREATE TABLE GAMES (
	ID int PRIMARY KEY,
	WHITE_OPPONENT string NOT NULL,
	BLACK_OPPONENT string NOT NULL
);

CREATE TABLE MOVES (
	IDGAME int NOT NULL,
	NUM int NOT NULL,
	MOVE_WHITE string NOT NULL,
	MOVE_BLACK string,
	PRIMARY KEY (IDGAME, NUM)
);

INSERT INTO GAMES(ID, WHITE_OPPONENT, BLACK_OPPONENT) VALUES(1, 'KARPOV', 'KASPAROV');
INSERT INTO GAMES(ID, WHITE_OPPONENT, BLACK_OPPONENT) VALUES(2, 'FISHER', 'ALEKHINE');

INSERT INTO MOVES (IDGAME, NUM, MOVE_WHITE, MOVE_BLACK) VALUES(1, 1,'e2-e4', 'c7-c5');
INSERT INTO MOVES (IDGAME, NUM, MOVE_WHITE, MOVE_BLACK) VALUES(1, 2,'Ng1-f3', 'd7-d6');
INSERT INTO MOVES (IDGAME, NUM, MOVE_WHITE, MOVE_BLACK) VALUES(2, 1,'d2-d4', 'd7-d5');
INSERT INTO MOVES (IDGAME, NUM, MOVE_WHITE, MOVE_BLACK) VALUES(2, 2,'Nb1-c3', 'Ng8-f6');