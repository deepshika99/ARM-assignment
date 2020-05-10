	AREA SUMMARY,CODE,READONLY
	EXPORT __main
__main
	LDR R0,=0x10000000 ;base ptr
	MOV R1,#6 ;no of eles
	LDR R2,[R0] ;first largest
	LDR R3,[R0,#4]! ;2nd largest
	LDR R6,=0x10000018 ;limit
	CMP R3,R2
	BHI SWAP; if 2nd largest>largest,swap
	ADD R0,#4; go to 3rd element
LOOP CMP R0,R6 ;check limit
	BEQ STOP
	LDR R4,[R0]
	CMP R4,R2
	BHI LOOP2
	CMP R4,R3
	BHI LOOP1
	ADD R0,#4
	B LOOP
LOOP1 LDR R3,[R0],#4
LOOP2 MOV R5,R2 
	LDR R2,[R0],#4
	MOV R3,R5	
	B LOOP
SWAP 	
	MOV R4,R2 ; this and nxt 2 lines for swap
	MOV R2,R3;swap
	MOV R3,R4;swap
	B LOOP	
STOP B STOP
	END