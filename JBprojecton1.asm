inicio:
	call retardo

	jmp inicio

retardo:
	lDI R17, 229
	LDI R19, 43
loop2:
	LDI R18, 255

Loop1:
    DEC R18
	BRNE Loop1
	DEC R17
	BRNE Loop2

loop3:
	DEC R19
	BRNE loop3
	NOP
	RET
