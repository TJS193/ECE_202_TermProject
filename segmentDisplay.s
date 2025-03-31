	AREA    segmentDisplay, CODE, READONLY
	EXPORT	__segmentDisplay				; make __main visible to linker
	;ENTRY			
	
__segmentDisplay PROC 

;--------------------------------------------------------
segDisplay	PROC
	


		CMP r2, #1
		BEQ sA
		CMP r2, #2
		BEQ sB
		CMP r2, #3
		BEQ sC
		B els

sA    	MOV r10, #0x4
		B disp
sB    	MOV r10, #0x8
		B disp
sC    	MOV r10, #0xC
		B disp
els   	MOV r10, #0x0

    
disp	
		LDR r4, =GPIOD_BASE        ; Load GPIOD base address
		LDR r9, [r4, #GPIO_ODR]
		BIC r9, #0xFF
		MOV r9, r10
		STR r9, [r4, #GPIO_ODR]    ; Write result to GPIO output register
		

		MOV r5, #9999
		
delay	SUB r5,r5,#1
		CMP r5, #0
		BNE delay

		BX LR
		ENDP
;--------------------------------------------------------------


		ENDP
