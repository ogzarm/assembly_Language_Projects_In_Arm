.syntax unified

.global main

main:
	bl init_rgb_display

	//reset pb6=1
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #6
	mov r2,#1
	bl writeIO
dongu:
	//B10=0
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#0
	bl writeIO

	//Data PB11 =0
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#0
	bl writeIO

	//counter R6=16
	mov r6,#16
loop:
	sub r6,r6,#1

	//pc10=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#0
	bl writeIO

	//pc10 =1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#1
	bl writeIO
	cmp r6,#0
	bne loop

	//Data PB11 =1
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#1
	bl writeIO

	//counter R6
	mov r6,#8
loop1:
	sub r6,r6,#1
	//pc10=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#0
	bl writeIO


	//pc10 =1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#1
	bl writeIO
	cmp r6,#0
	bne loop1



	//c11=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#0
	bl writeIO

	//c11=1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#1
	bl writeIO

	//a4,a14,a13,a7,a5,a15=1
	mov r0,#0
	ldr r1,=57520
	mov r2,#1
	bl writeIO

	//c5=1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #5
	mov r2,#1
	bl writeIO

	//b3=1
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #3
	mov r2,#1
	bl writeIO


	ldr r0, =50000000
	//delay
	bl _delay

	//Data PB11 =0
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#0
	bl writeIO


	//8 bit right shift
	//counter R6
	mov r6,#8
loop2:
	sub r6,r6,#1
	//pc10=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#0
	bl writeIO


	//pc10 =1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#1
	bl writeIO
	cmp r6,#0
	bne loop2

	//c11=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#0
	bl writeIO

	//c11=1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#1
	bl writeIO

	//a4,a14,a13,a7,a5,a15=1
	mov r0,#0
	ldr r1,=57520
	mov r2,#1
	bl writeIO

	//c5=1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #5
	mov r2,#1
	bl writeIO

	//b3=1
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #3
	mov r2,#1
	bl writeIO

	//8 bit right shift
	ldr r0, =50000000
	//delay
	bl _delay
	//Data PB11 =1
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#1
	bl writeIO

	//8 bit right shift
	//counter R6
	mov r6,#24
loop3:
	sub r6,r6,#1
	//pc10=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#0
	bl writeIO


	//pc10 =1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#1
	bl writeIO
	cmp r6,#0
	bne loop3

//Data PB11 =0
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#0
	bl writeIO

	//8 bit right shift
	//counter R6
	mov r6,#16
loop4:
	sub r6,r6,#1
	//pc10=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#0
	bl writeIO


	//pc10 =1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #10
	mov r2,#1
	bl writeIO
	cmp r6,#0
	bne loop4
	//c11=0
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#0
	bl writeIO

	//c11=1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #11
	mov r2,#1
	bl writeIO

	//a4,a14,a13,a7,a5,a15=1
	mov r0,#0
	ldr r1,=57520
	mov r2,#1
	bl writeIO

	//c5=1
	mov r0,#2
	mov r1,#1
	mov r1,r1,lsl #5
	mov r2,#1
	bl writeIO

	//b3=1
	mov r0,#1
	mov r1,#1
	mov r1,r1,lsl #3
	mov r2,#1
	bl writeIO
	ldr r0, =50000000
	bl _delay
	b dongu





_delay:
	push {lr}

	_delayLoop:
		cmp r0, #0
		beq _delayExit
		sub r0, r0, #1
		B _delayLoop

	_delayExit:
		pop {pc}


