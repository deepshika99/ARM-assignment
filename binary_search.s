	AREA WORD,CODE,READONLY
	EXPORT __main
__main
	LDR R1,=0x10000000 ;base ptr
	MOV R2,#5 ;no of elements
	LDR R5,=0x00000020 ;ele to be searched
	MOV R7,#2
	ADD R3,R1,#16;r3 is last element ptr
LOOP CMP R1,R4  ;  \ to check if element has not been found
	BEQ STOP    ;   \ 
	CMP R3,R4   ;   /
	BEQ STOP  ;    /
	ADD R4,R1,R3 ; \ this and next line to find mid
	UDIV R4,R7    ; /  R4 is mid
	AND R9,R4,#3; \ to make mid byte aligned
	SUB R4,R9   ; /
	LDR R0,[R4]
	CMP R0,R5
	BEQ DONE ;if found
	BHI LOOP1 ;if ele is larger than mid
	ADD R1,R4,#4 ;else ele is less than mid
	B LOOP
LOOP1 SUB R3,R4,#4
	B LOOP
DONE MOV R8,#1 ; if R8 is 1 ele found else it is 0
	B STOP
STOP B STOP
	END

