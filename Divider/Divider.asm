;By : Soheil Nadernezhad
.cseg
.org 0
jmp start
.org 0x30
start:
ldi r16,high(ramend)
out sph,r16
ldi r16,low(ramend)
out spl,r16
;-------------------
ldi r16,0x00
out ddra,r16
out ddrb,r16

ldi r16,0xff
out ddrc,r16
out ddrd,r16

s1:
in r16,pina
in r17,pinb
ldi r18, 0
cp r16, r17
brge s2
s3:
out portc, r18
out portd, r16
jmp s1
s2:
sub r16, r17
inc r18
cp r16, r17
brlo s3
jmp s2
