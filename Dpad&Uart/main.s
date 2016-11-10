.syntax unified

.global main

main:
	bl uart_init
	bl init_dpad

	//PC12 and PC13
	mov r0,#2
	mov r1,#1
	lsl r1,r1,#12
	lsl r3,r1,#1
	add r1,r1,r3
	mov r2,#1
	bl writeIO
start:
	//output(PA4,PA14,PA13,PA7) is zero
	mov r0,#0
	mov r1,#1
	lsl	r1,r1,#4
	lsl r3,r1,#3
	lsl r4,r1,#9
	lsl r5,r1,#10
	add r5,r5,r4
	add r5,r5,r3
	add r1,r1,r5
	mov r2,#0
	bl writeIO

	//find zero input
loop:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl#26
	lsr r1,#31
	cmp r1,#0
	beq next
	//movs r1,r0,rrx #6
	//bcc next
	mov r1,r0,lsl #16
	lsr r1,#31
	cmp r1,#0
	beq next1
	//movs r0,r0,rrx #16
	//bcc next1

	b step2
next:
	mov r4,#0
	b end

next1:
	mov r4,#2
	b end
step2:
	mov r0,#1
	bl readIO
	mov r1,r0,lsl #28
	lsr r1,#31
	cmp r1,#0
	beq next2
	//movs r1,r0,rrx #4
	//bcc next2
	b step3
next2:
	mov r4,#3
	b end

step3:
	mov r0,#2
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq next3
	//movs r1,r0,rrx #6
	//bcc next3
	b loop

next3:
	mov r4,#1

end:
	//PA7 is 0 and PA4,14,13 is 1
	mov r0,#0
	mov r2,#1
	movw r1,0x00006010
	bl writeIO
	mov r0,#0
	mov r2,#0
	mov r1,0x00000080
	bl writeIO
	cmp r4,#0
	beq satir1
	cmp r4,#1
	beq satir2
	cmp r4,#2
	beq satir3
	cmp r4,#3
	beq satir4

satir1:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq biredort
	//movs r1,r0,rrx #6
	//bcs	 biredort
	b mevcutDegil
satir2:
	mov r0,#2
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq ikiyedort
	//movs r1,r0,rrx #6
	//bcs ikiyedort
	b mevcutDegil
satir3:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #16
	lsr r1,#31
	cmp r1,#0
	beq ucedort
	//movs r1,r0,rrx #16
	//bcs ucedort
	b mevcutDegil
satir4:
	mov r0,#1
	bl readIO
	mov r1,r0,lsl #28
	lsr r1,#31
	cmp r1,#0
	beq dortedort
	//movs r1,r0,rrx #4
	//bcs dortedort

	//PA7 outputunda deðil.Burada PA13'e bakcaz.PA4,14,7 is 1. PA13 is zero.
mevcutDegil:
	mov r0,#0
	mov r2,#1
	movw r1,0x00004090
	bl writeIO
	mov r0,#0
	mov r2,#0
	mov r1,0x00002000
	bl writeIO
	cmp r4,#0
	beq _1satir1
	cmp r4,#1
	beq _1satir2
	cmp r4,#2
	beq _1satir3
	cmp r4,#3
	beq _1satir4

_1satir1:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq bireuc
	//movs r1,r0,rrx #6
	//bcs	 bireuc
	b mevcutDegil1
_1satir2:
	mov r0,#2
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq ikiyeuc
	//movs r1,r0,rrx #6
	//bcs ikiyeuc
	b mevcutDegil1
_1satir3:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #16
	lsr r1,#31
	cmp r1,#0
	beq uceuc
	//movs r1,r0,rrx #16
	//bcs uceuc
	b mevcutDegil1
_1satir4:
	mov r0,#1
	bl readIO
	mov r1,r0,lsl #28
	lsr r1,#31
	cmp r1,#0
	beq dorteuc
	//movs r1,r0,rrx #4
	//bcs dorteuc

//PA13 outputunda deðil.Burada PA14'e bakcaz.PA4,7,13 is 1. PA14 is zero.
mevcutDegil1:

	mov r0,#0
	mov r2,#1
	movw r1,0x00002090
	bl writeIO
	mov r0,#0
	mov r2,#0
	mov r1,0x00004000
	bl writeIO
	cmp r4,#0
	beq _2satir1
	cmp r4,#1
	beq _2satir2
	cmp r4,#2
	beq _2satir3
	cmp r4,#3
	beq _2satir4

_2satir1:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq bireiki
	//movs r1,r0,rrx #6
	//bcs	 bireiki
	b mevcutDegil2
_2satir2:
	mov r0,#2
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq ikiyeiki
	//movs r1,r0,rrx #6
	//bcs ikiyeiki
	b mevcutDegil2
_2satir3:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #16
	lsr r1,#31
	cmp r1,#0
	beq uceiki
	//movs r1,r0,rrx #16
	//bcs uceiki
	b mevcutDegil2
_2satir4:
	mov r0,#1
	bl readIO
	mov r1,r0,lsl #28
	lsr r1,#31
	cmp r1,#0
	beq dorteiki
	//movs r1,r0,rrx #4
	//bcs dorteiki

//PA14 outputunda deðil.Burada PA4'e bakcaz.PA7,13,14 is 1. PA4 is zero.
mevcutDegil2:


	mov r0,#0
	mov r2,#1
	mov r1,0x00006080
	bl writeIO
	mov r0,#0
	mov r2,#0
	mov r1,0x00000010
	bl writeIO
	cmp r4,#0
	beq _3satir1
	cmp r4,#1
	beq _3satir2
	cmp r4,#2
	beq _3satir3
	cmp r4,#3
	beq _3satir4

_3satir1:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq birebir
	//movs r1,r0,rrx #6
	//bcs	 birebir
	b mevcutDegil2
_3satir2:
	mov r0,#2
	bl readIO
	mov r1,r0,lsl #26
	lsr r1,#31
	cmp r1,#0
	beq ikiyebir
	//movs r1,r0,rrx #6
	//bcs ikiyebir
	b mevcutDegil2
_3satir3:
	mov r0,#0
	bl readIO
	mov r1,r0,lsl #16
	lsr r1,#31
	cmp r1,#0
	beq ucebir
	//movs r1,r0,rrx #16
	//bcs ucebir
	b mevcutDegil2
_3satir4:
	mov r0,#1
	bl readIO
	mov r1,r0,lsl #28
	lsr r1,#31
	cmp r1,#0
	beq dortebir
	//movs r1,r0,rrx #4
	//bcs dortebir

biredort:
	mov r0, #65				//A
	bl uart_write
	b start
ikiyedort:
	mov r0, #66				//B
	bl uart_write
	b start
ucedort:
	mov r0, #67				//C
	bl uart_write
	b start
dortedort:
	mov r0, #68				//D
	bl uart_write
	b start

bireuc:
	mov r0, #51				//3
	bl uart_write
	b start
ikiyeuc:
	mov r0, #54				//6
	bl uart_write
	b start
uceuc:
	mov r0, #57				//9
	bl uart_write
	b start
dorteuc:
	mov r0, #35				//A
	bl uart_write
	b start

bireiki:
	mov r0, #50				//2
	bl uart_write
	b start
ikiyeiki:
	mov r0, #53				//5
	bl uart_write
	b start
uceiki:
	mov r0, #56				//8
	bl uart_write
	b start
dorteiki:
	mov r0, #48				//0
	bl uart_write
	b start

birebir:
	mov r0, #49				//1
	bl uart_write
	b start
ikiyebir:
	mov r0, #52				//4
	bl uart_write
	b start
ucebir:
	mov r0, #55				//7
	bl uart_write
	b start
dortebir:
	mov r0, #42				//*
	bl uart_write
	b start
