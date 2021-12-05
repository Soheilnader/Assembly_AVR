;By : Soheil Nadernezhad
.cseg
.org 0
JMP start
.org 0x30
start:
LDI r16,high(ramend)
OUT sph,r16
LDI r16,low(ramend)
OUT spl,r16
;-------------------

LDI r16,0x00
OUT ddra,r16
OUT ddrb,r16

LDI r16,0xff
OUT ddrc,r16
OUT ddrd,r16

s1:
IN r16,pina
IN r17,pinb
LDI r18, 0
CP r16, r17
BRSH s2		; if r16>r17 : jump to s2
s3:
OUT portc, r18
OUT portd, r16
JMP s1
s2:
SUB r16, r17
INC r18
CP r16, r17
BRLO s3		; if r16<r17 : jump to s3
JMP s2
