.include "./m328Pdef.inc"

; ------Vectores de interrupcion ----------
      .org     0x00
	  jmp      setup
      jmp      inicio
      jmp      EXT_INT0
      jmp      EXT_INT1
      jmp      PC_INT0
      jmp      PC_INT1
      jmp      PC_INT2
      jmp      WDT
      jmp      TIM2_COMPA
      jmp      TIM2_COMPB
      jmp      TIM2_OVF
      jmp      TIM1_CAPT
      jmp      TIM1_COMPA
      jmp      TIM1_COMPB
      jmp      TIM1_OVF
      jmp      TIM0_COMPA
      jmp      TIM0_COMPB
      jmp      TIM0_OVF
      jmp      SPI_STC
      jmp      USART_RXC
      jmp      USART_UDRE
      jmp      USART_TXC
      jmp      ADC_RDY
      jmp      EE_RDY
      jmp      ANA_COMP
      jmp      TWI
      jmp      SPM_RDY
      jmp      EXT_INT0

//-----------------INICIACION--------------
setup:
	;pongo el pin c3 en entrada
	cbi	DDRc,3
	;activo res pull-up
	sbi PORTc,3
	;pongo el pin c2 en salida
	sbi DDRc,2
	;pongo el pin d2 en salida
	sbi DDRd,2
	
	sbi PCINT,11
	sbi	PCMSK,1
	sei

//--------- PROGRAMA PRINCIPAL -----------
inicio:
	sbi PORTc,2
	call retardo
	cbi PORTc,2
	call retardo
	jmp inicio


//-------------------RETARDO--------------

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
      


//---------INTERRUPCION INTP11------------------
PC_INT11:
	sbis PINc,3
	jmp finintpc
	sbis PINd,2
	jmp ledPrendido
ledApagado:
	sbi PORTd.2
	reti
ledPrendido:
	cbi PORTd,2
	reti
finintpc:
	reti
;------------ VECTORES DE INTERRUPCION ----------------
EXT_INT0:
EXT_INT1:
PC_INT0:
PC_INT1:
PC_INT2:
WDT:
TIM2_COMPA:
TIM2_COMPB:
TIM2_OVF:
TIM1_CAPT:
TIM1_COMPA:
TIM1_COMPB:
TIM1_OVF:
TIM0_COMPA:
TIM0_COMPB:
TIM0_OVF:
SPI_STC:
USART_RXC:
USART_UDRE:
USART_TXC:
ADC_RDY:
EE_RDY:
ANA_COMP:
TWI:
SPM_RDY:
    reti
;-----------------------------------
