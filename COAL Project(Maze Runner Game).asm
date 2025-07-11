[org 0x0100]
jmp start
position: dw 180 ; middle of screen (default)
oldISR: dd 0,0
randNum:dw 0
score:dw 0
message: db 'Score' ; string to be printed 
length: dw 5
message2: db "Created by Shafan & Zain 804"
length2: dw 28
tickcount: dw 61   ;;chaning time
tickDelay:dw 18
health:dw 2
message3:db "Health"
length3:dw 6
message4:db"Timer"
length4:dw 5
supermanIdx:dw 0
isSupermanMode:dw 0
 infoText: db 'INSTRUCTIONS FOR MAZE RUNNER GAME:'
    line1: db '* Use the arrow keys to move the pointer in the maze.', 0
    line2: db '1. Press the Up arrow key to move the pointer upwards.', 0
    line3: db '2. Press the Down arrow key to move the pointer downwards.', 0
    line4: db '3. Press the Left arrow key to move the pointer to left.', 0
    line5: db '4. Press the Right arrow key to move the pointer to right.', 0
    line6: db '* Be aware of the enemies; they will be waiting to reduce your health.', 0
    line7: db '* Unlock hidden treasures with every step by collecting collectables', 0
	line8: db '* Remember time is money',0
	superManModeLine:db '* SuperMan Mode will increase score by 1000,time by 10 seconds and will make      health full i.e. 2',0

	line9: db 'REWARDS INFO',0
	line10:db 'will increase score by 100',0
	line11:db 'will increase score by 300',0
	line12:db 'will increase score by 500',0
	line13:db "Press B to go back to Menu page",0
	line20:db"Superman",0
	line21:db"Mode",0
	line22:db "is",0
	line23:db "Activated",0
	line26:db "Congratulations",0
	line24:db "You Lost the Game!",0
	line25:db"You Win The Game!",0
	delay2:
push cx
mov cx, 10; change the values to increase delay time
delay_loop3:
push cx
mov cx, 0xFFFF
delay_loop4:
loop delay_loop4
pop cx
loop delay_loop3
pop cx
ret
	
clrscr:       push es 
              push ax 
              push di 
             mov  ax, 0xb800 
              mov  es, ax             ; point es to video base 
              mov  di, 0        ; point di to top left column 
 
nextloc:      mov  word [es:di], 0x0720 ; clear next char on screen 
              add  di, 2              ; move to next screen location 
              cmp  di, 4000           ; has the whole screen cleared 
              jne  nextloc            ; if no clear next position 
 
              pop  di 
              pop  ax 
              pop  es 
              ret
			  
	clrscr2:
    push es 
    push ax 
    push di 
    mov ax, 0xb800    ; Set ES to video memory base
    mov es, ax
    shl di, 1         ; Point to correct position (since each character cell is 2 bytes)
    mov word [es:di], 0x0720 ; Clear character at specific position
    pop di 
    pop ax 
    pop es 
    ret

    endscr:;;;;Screen for Winning
    push es
    push ax
    push di

    mov ax, 0xb800
    mov es, ax
    mov di,0	
    nextpos1:
        mov word [es:di], 0x0700
        add di, 2
        cmp di, 4000
        jne nextpos1
		

			  mov  ax, 32
              push ax                 ; push x position  
              mov  ax, 5
              push ax                 ; push y position  
              mov  ax, 0x03            ; blue on black attribute 
              push ax                 ; push attribute  
              mov  ax,line26
			  push ax                 ; push address of message 
              push 15     ; push message length 
              call printstr
		      mov  ax, 31
              push ax                 ; push x position  
              mov  ax, 7
              push ax                 ; push y position  
              mov  ax, 0x05             ; blue on black attribute 
              push ax                 ; push attribute  
              mov  ax,line25
			  push ax                 ; push address of message 
              push 17    ; push message length 
              call printstr
		mov di,1664

		mov al,"*"
		mov ah,0x07
		mov cx,16
		opl:
		mov word[es:di],ax
		add di,2
		loop opl
		sub di,2
		add di,160
		mov cx,8
		opl2:
		mov word[es:di],ax
		add di,160
		loop opl2
		sub di,160
		mov cx,15
		sub di,2
		kio:
		mov word[es:di],ax
		sub di,2
		loop kio
		add di,2
		sub di,160
		mov cx,7
		rt:
		mov word[es:di],ax
		sub di,160
		loop rt
	mov byte [es:1990],'G'
	mov byte [es:1992],'A'
	mov byte [es:1994],'M'
	mov byte [es:1996],'E'
	mov byte [es:1998],' '
	mov byte [es:2000],'O'
	mov byte [es:2002],'V'
	mov byte [es:2004],'E'
	mov byte [es:2006],'R'
	
	mov byte [es:2310],'S'
	mov byte [es:2312],'C'
	mov byte [es:2314],'O'
	mov byte [es:2316],'R'
	mov byte [es:2318],'E'
	mov byte [es:2320],'='
	
	mov byte[es:2630],"H"
	mov byte[es:2632],"e"
		mov byte[es:2634 ],"a"
			mov byte[es:2636],"l"
				mov byte[es:2638],"t"
					mov byte[es:2640],"h"
				mov byte[es:2642],"="
						
	mov ax,[score]
	push ax
	call printnum3
	mov ax,[health]
	push ax
	call printnum4
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay2              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay2             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay2             
    call disableSpeaker  
    pop di
    pop ax
    pop es
	jmp end
    ret
	
	
	endscr2:;;;;Screen for Losing
    push es
    push ax
    push di

    mov ax, 0xb800
    mov es, ax
    mov di,0	
    nextpos4:
        mov word [es:di], 0x0700
        add di, 2
        cmp di, 4000
        jne nextpos4
		

	
		      mov  ax, 31
              push ax                 ; push x position  
              mov  ax, 7
              push ax                 ; push y position  
              mov  ax, 0x03             ; blue on black attribute 
              push ax                 ; push attribute  
              mov  ax,line24
			  push ax                 ; push address of message 
              push 18      ; push message length 
              call printstr
		
		
		mov di,1664
         
		mov al,"*"
		mov ah,0x07
		mov cx,16
		opl5:
		mov word[es:di],ax
		add di,2
		loop opl5
		sub di,2
		add di,160
		mov cx,8
		opl23:
		mov word[es:di],ax
		add di,160
		loop opl23
		sub di,160
		mov cx,15
		sub di,2
		kio3:
		mov word[es:di],ax
		sub di,2
		loop kio3
		add di,2
		sub di,160
		mov cx,7
		rt3:
		mov word[es:di],ax
		sub di,160
		loop rt3
	mov byte [es:1990],'G'
	mov byte [es:1992],'A'
	mov byte [es:1994],'M'
	mov byte [es:1996],'E'
	mov byte [es:1998],' '
	mov byte [es:2000],'O'
	mov byte [es:2002],'V'
	mov byte [es:2004],'E'
	mov byte [es:2006],'R'
	
	mov byte [es:2310],'S'
	mov byte [es:2312],'C'
	mov byte [es:2314],'O'
	mov byte [es:2316],'R'
	mov byte [es:2318],'E'
	mov byte [es:2320],'='
	
	mov byte[es:2630],"H"
	mov byte[es:2632],"e"
		mov byte[es:2634 ],"a"
			mov byte[es:2636],"l"
				mov byte[es:2638],"t"
					mov byte[es:2640],"h"
				mov byte[es:2642],"="
						
	mov ax,[score]
	push ax
	call printnum3
	mov ax,[health]
	push ax
	call printnum4
			    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay2              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay2             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay2             
    call disableSpeaker  
    pop di
    pop ax
    pop es
	jmp end
    ret
printnum4: ;;;;For health
push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov ax, [bp+4] ; load number in ax 
 mov bx, 10 ; use base 10 for division 
 mov cx, 0 ; initialize count of digits 
nextdigit6: mov dx, 0 ; zero upper half of dividend 
 div bx ; divide by 10 
 add dl, 0x30 ; convert digit into ascii value 
 push dx ; save ascii value on stack 
 inc cx ; increment count of values 
 cmp ax, 0 ; is the quotient zero 
 jnz nextdigit6; if no divide it again 
 mov di,2646 ; point di to top left column 
nextpos6: pop dx ; remove a digit from the stack 
 mov dh, 0x07 ; use normal attribute 
 mov [es:di], dx ; print char on screen 
 add di, 2 ; move to next screen location 
 loop nextpos6 ; repeat for all digits on stack
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 
 pop es 
 pop bp 
 ret 2
	
	printnum3: ;;;For score
	push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov ax, [bp+4] ; load number in ax 
 mov bx, 10 ; use base 10 for division 
 mov cx, 0 ; initialize count of digits 
nextdigit5: mov dx, 0 ; zero upper half of dividend 
 div bx ; divide by 10 
 add dl, 0x30 ; convert digit into ascii value 
 push dx ; save ascii value on stack 
 inc cx ; increment count of values 
 cmp ax, 0 ; is the quotient zero 
 jnz nextdigit5 ; if no divide it again 
 mov di,2324 ; point di to top left column 
nextpos5: pop dx ; remove a digit from the stack 
 mov dh, 0x07 ; use normal attribute 
 mov [es:di], dx ; print char on screen 
 add di, 2 ; move to next screen location 
 loop nextpos5 ; repeat for all digits on stack
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 
 pop es 
 pop bp 
 ret 2
	
	sound:
    push ax
    push bx
    push dx
    mov bx,2153
    xor dx, dx              
    div bx               
    mov al, 0xB6            
    out 0x43, al          
    mov al, al             
    out 0x42, al            
    mov al, ah              
    out 0x42, al           
    in al, 0x61             
    or al, 0x03           
    out 0x61, al          
    pop dx
    pop bx
    pop ax
    ret

nosound:
    push ax
    in al, 0x61             
    and al, 0xFC           
    out 0x61, al           
    pop ax
    ret
	
	
	
setFrequency:
    push ax
    push bx
    push dx

    mov bx, 2153        
    xor dx, dx              
    div bx                  
    
    mov al, 0xB6           
    out 0x43, al           
    
    mov al, bl             
    out 0x42, al           
    mov al, bh             
    out 0x42, al           

    pop dx
    pop bx
    pop ax
    ret


enableSpeaker:
    in al, 0x61            
    or al, 0x03            
    out 0x61, al            
    ret


disableSpeaker:
    in al, 0x61           
    and al, 0xFC          
    out 0x61, al           
    ret
	
printAsterisk: 
    
    push es
    push ax
    push di
    mov ax, 0xb800   
    mov es, ax
    mov di, [position]
    shl di, 1 
	cmp di,dx
    je endscr
	cmp di,[supermanIdx];;;If index matches with that special character
	je setSuperman
	jmp setAsterisk
	setSuperman:
		    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
     mov ax, 5
 push ax ; push x position 
 mov ax, 7
 push ax ; push y position 
 mov ax, 0x0d ; blue on black attribute 
 push ax ; push attribute 
 mov ax, line20
 push ax ; push address of message 
 push 8
call printstr

     mov ax, 7
 push ax ; push x position 
 mov ax, 9
 push ax ; push y position 
 mov ax, 0x0e ; blue on black attribute 
 push ax ; push attribute 
 mov ax, line21
 push ax ; push address of message 
 push 4
call printstr

     mov ax, 8
 push ax ; push x position 
 mov ax, 11
 push ax ; push y position 
 mov ax, 0x04 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, line22
 push ax ; push address of message 
 push 2
call printstr

     mov ax, 5
 push ax ; push x position 
 mov ax, 13
 push ax ; push y position 
 mov ax, 0x03 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, line23
 push ax ; push address of message 
 push 9
call printstr
	
	mov word[health],2
	mov ax,[health]
	push ax
	call printnum2
	add word[score],1000
	mov ax,[score]
	push ax
	call printnum
	add word[tickcount],10
	mov ax,[tickcount]
	push ax
	call printnumForTimer
	; mov ax,0xb800
	; mov es,ax
	mov word[isSupermanMode],1;;;Setting flag so that the normal character can be changed into superman
	jmp exitSuperman
	setAsterisk:
	cmp word[isSupermanMode],1
	je setSuperAsterisk
	; Set 'asterisk' character
    mov word[es:di], 0x0701
		    mov ax, 440
    call sound
    mov cx, 0xFFFF        
    call delay
    call nosound         
    mov ax, 523
    call sound
    mov cx, 0xFFFF        
    call delay
    call nosound          
    mov ax, 659
    call sound
    mov cx, 0xFFFF        
    call delay
    call nosound 
	jmp exitSuperman
	setSuperAsterisk:
	mov al,0x02      ;;;;;;;
    mov ah,0x0e
	mov word[es:di],ax
	    mov ax, 440
    call sound
    mov cx, 0xFFFF        
    call delay
    call nosound         
    mov ax, 523
    call sound
    mov cx, 0xFFFF        
    call delay
    call nosound          
    mov ax, 659
    call sound
    mov cx, 0xFFFF        
    call delay
    call nosound 
	exitSuperman:
    pop di
    pop ax
    pop es
	
    ret 

customISR:
push ax
push es
push di
mov ah, 0
int 0x16
cmp ah, 0x4B
je moveLeft
cmp ah, 0x48
je moveUp
cmp ah, 0x50
je moveDown
cmp ah, 0x4D
je moveRight
jmp exitISR


	
	moveLeft:
    mov di, [position]
    cmp di, 0
    je exitISR   	; Prevent moving left beyond left edge of screen
    cmp di,dx       ;If location matches with the location where ending character is placed then game will end
    je endscr
    ; Load video memory base
    mov ax, 0xb800
    mov es, ax
    ; Calculate new video memory position for left check
    mov bx, di
    dec bx
    shl bx, 1            ; Convert position to offset
    ; Check if the position contains the boundary '*'
    cmp byte [es:bx], 0x2A
    je exitISR         ; If boundary, exit without changing position
	
    cmp byte[es:bx],0x0e
	jne sr2
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker     
	add word[score],100
	mov ax,[score]
	push ax
	call printnum
	sr2:
	cmp byte[es:bx],0x09
	jne sr3
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker      
	add word[score],300
	mov ax,[score]
	push ax
	call printnum
	sr3:
	cmp byte[es:bx],0x04
	jne nop
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker     
	add word[score],500
	mov ax,[score]
	push ax
	call printnum
	nop:
	cmp byte[es:bx],0x15
	jne bb

	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker       
	dec word[health]
		cmp word[health],0
	je endscr2
	mov ax,[health]
	push ax
	call printnum2
    ; Update position and proceed to display update
	bb:
    dec word [position]
    jmp updateDisplay

moveRight:
mov di, [position]
cmp di, 1999;BOundry check
je exitISR
cmp di,dx ;If location matches with the location where ending character is placed then game will end
je endscr
 ; Load video memory base
 

    mov ax, 0xb800
    mov es, ax
    ; Calculate new video memory position for left check
    mov bx, di
    inc bx
    shl bx, 1            ; Convert position to offset
    ; Check if the position contains the boundary '*'
    cmp byte [es:bx], 0x2A
    je exitISR   
 	cmp byte[es:bx],0x0e
	jne sr7
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],100
	mov ax,[score]
	push ax
	call printnum
	sr7:
	cmp byte[es:bx],0x09
	jne sr8
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],300
	mov ax,[score]
	push ax
	call printnum
	sr8:
	cmp byte[es:bx],0x04
	jne nop2
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    
	add word[score],500
	mov ax,[score]
	push ax
	call printnum
	nop2:
		cmp byte[es:bx],0x15
	jne bb3
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	dec word[health]
		cmp word[health],0
	je endscr2
	
	mov ax,[health]
	push ax
	call printnum2
	bb3:
inc word [position]
jmp updateDisplay

moveUp:
mov di, [position]
cmp di, 80
jb exitISR
cmp di,dx ;If location matches with the location where ending character is placed then game will end
je endscr

 mov ax, 0xb800
    mov es, ax
    mov bx, di
    sub bx, 80               ; Calculate position above
    shl bx, 1                ; Convert to video memory position
    cmp byte [es:bx], 0x2A   ; Check for boundary character '*'
    je exitISR  
 	cmp byte[es:bx],0x0e
	jne sr9
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],100
	mov ax,[score]
	push ax
	call printnum
	sr9:
	cmp byte[es:bx],0x09
	jne sr6
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],300
	mov ax,[score]
	push ax
	call printnum
	sr6:
	cmp byte[es:bx],0x04
	jne nop3
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],500
	mov ax,[score]
	push ax
	call printnum
	nop3:
		cmp byte[es:bx],0x15
	jne bb4
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	dec word[health]
		cmp word[health],0
	je endscr2
	mov ax,[health]
	push ax
	call printnum2
	bb4:
sub word [position], 80
jmp updateDisplay

moveDown:
mov di, [position]
cmp di, 1920
ja exitISR
cmp di,dx
je endscr

 mov ax, 0xb800
    mov es, ax
    mov bx, di
    add bx, 80               ; Calculate position below
    shl bx, 1                ; Convert to video memory position
    cmp byte [es:bx], 0x2A   ; Check for boundary character '*'
    je exitISR     
 	cmp byte[es:bx],0x0e
	jne sr11
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],100
	mov ax,[score]
	push ax
	call printnum
	sr11:
	cmp byte[es:bx],0x09
	jne sr12
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],300
	mov ax,[score]
	push ax
	call printnum
	sr12:
	cmp byte[es:bx],0x04
	jne nop4
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	add word[score],500
	mov ax,[score]
	push ax
	call printnum
	nop4:
		cmp byte[es:bx],0x15
	jne bb5
	    mov ax, 440            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF        
    call delay              
    call disableSpeaker   

    
    mov ax, 523            
    call setFrequency      
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker    

    mov ax, 659            
    call setFrequency       
    call enableSpeaker      
    mov cx, 0xFFFF          
    call delay             
    call disableSpeaker  
	dec word[health]
	cmp word[health],0
	je endscr2                    ;;;;;;;;;;;;;;;;;;;;;
	mov ax,[health]
	push ax
	call printnum2
	bb5:
add word [position], 80
jmp updateDisplay

updateDisplay:

call clrscr2
call printAsterisk

exitISR:
pop di
pop es
pop ax
iret	

maze1:
push bp
mov bp,sp
push es
push ax
push cx
push di
mov ax,0xb800
mov es,ax
mov al,'*'
mov ah,0x66  ;color
mov di,196 ;top
mov si,di
mov cx,44

l2:
mov [es:di],ax
add di,2
loop l2
mov bx,di
mov di,si
add di,160  ;left
mov cx,22

l3:
mov [es:di],ax
add di,160
loop l3
sub di,160  ;bottom
add di,2
mov cx,43

l4:
mov [es:di],ax
add di,2
loop l4
sub di,2
sub di,160
mov cx,21   ;right
l5:
mov [es:di],ax
sub di,160
loop l5

mov di,si
add di,22
add di,160
mov [es:di],ax
add di,160
mov cx,24
l6:
mov [es:di],ax
add di,2
loop l6
mov dx,di
mov di,bx
sub di,2
add di,160
sub di,10

mov [es:di],ax
add di,160
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
mov [es:di],ax
add di,2
mov [es:di],ax
add di,160
mov [es:di],ax

mov di,si
add di,320
mov cx,10
l7:
mov [es:di],ax
add di,2
loop l7
sub di,2
add di,160
mov si,di
mov cx,6
l8:
mov [es:di],ax
add di,160
loop l8
sub di,160
sub di,2
mov cx,4
l12:
mov [es:di],ax
sub di,2
loop l12

mov di,dx
add di,2
mov [es:di],ax

mov di,si
sub di,4
mov cx,2
l13:
mov [es:di],ax
add di,160
loop l13


sub di,326
add di,160
mov cx,14
l11:
mov [es:di],ax
add di,160
loop l11
sub di,160
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,160
mov [es:di],ax

sub di,4
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
mov cx,7
l15:
mov [es:di],ax
add di,2
loop l15
sub di,2
sub di,4
sub di,160
mov cx,8
l16:
mov [es:di],ax
sub di,160
loop l16
add di,160
add di,2
mov cx,3
l17:
mov [es:di],ax
add di,2
loop l17
sub di,2
sub di,160
mov si,di
mov cx,6
l18:
mov [es:di],ax
sub di,160
loop l18
mov bx,di
mov di,si
sub di,160
sub di,2
mov cx,5
l19:
mov [es:di],ax
sub di,2
loop l19
add di,2
mov cx,6
l20:
mov [es:di],ax
add di,160
loop l20

mov di,bx
sub di,162
mov cx,4
l21:
mov [es:di],ax
add di,2
loop l21
sub di,2
mov cx,11
l22:
mov [es:di],ax
add di,160
loop l22
sub di,160
mov si,di
sub di,2

sub di,2
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax

mov cx,4
l23:
mov [es:di],ax
add di,2
loop l23
sub di,4
add di,160
mov [es:di],ax
sub di,8
add di,160
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
mov bx,di

mov di,bx
add di,4
mov cx,4
l25:
mov [es:di],ax
add di,160
loop l25
sub di,320
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax

mov di,si
add di,2
mov si,di
mov cx,4
l26:
mov [es:di],ax
add di,2
loop l26
sub di,2
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
sub di ,4
mov [es:di],ax
mov bx,di
mov cx,3
l27:
mov [es:di],ax
add di,160
loop l27
sub di,160
mov cx,4
l28:
mov [es:di],ax
sub di,2
loop l28
mov di,bx
sub di,160
add di,4
mov [es:di],ax
add di,160
mov [es:di],ax
add di,2
mov [es:di],ax
mov cx,14
l29:
mov [es:di],ax
add di,2
loop l29
mov dx,di
sub di,24
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
mov dx,di
mov cx,6
l30:
mov [es:di],ax
add di,2
loop l30

add di,2
mov [es:di],ax
add di,160
mov [es:di],ax
sub di,160
add di,4
mov [es:di],ax
mov cx,6
l31:
mov [es:di],ax
add di,2
loop l31
sub di,2
sub di,160
mov [es:di],ax
mov si,di
mov di,dx
sub di,4
mov [es:di],ax
add di,160
mov [es:di],ax
mov di,si
add di,160
mov cx,8
l32:
mov [es:di],ax
sub di,160
loop l32

sub di,42
sub di,1440
mov cx,3
l33:
mov [es:di],ax
add di,160
loop l33
mov si,di
sub di,160
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
mov cx,4
l35:
add di,160
mov [es:di],ax
loop l35

sub di,2
mov cx,4
l34:
mov [es:di],ax
sub di,2
loop l34
add di,2
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax

add di,160
mov [es:di],ax
mov cx,4
l40:
add di,2
mov [es:di],ax
loop l40

mov dx,di

mov di,si
add di,160
sub di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax


mov di,dx
mov cx,2
l46:
add di,160
mov [es:di],ax
loop l46
add di,2
mov cx,15
l47:
mov [es:di],ax
add di,2
loop l47
mov dx,di

sub di,18
mov cx,2
l50:
add di,160
mov [es:di],ax
loop l50

mov cx,5
add di,4
l51:
mov [es:di],ax
add di,2
loop l51
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
sub di,2
add di,160
mov [es:di],ax

add di,160
mov [es:di],ax

mov di,dx
sub di,2
sub di,160
mov [es:di],ax
mov cx,9
l55:
sub di,160
mov [es:di],ax
loop l55

mov si,di

mov cx,4
l60:
add di,2
mov [es:di],ax
loop l60
mov dx,di   ;;contine

sub di,4
sub di,160
mov [es:di],ax

mov di,si
mov cx,12
sub di,4
mov si,di
l61:
mov [es:di],ax
sub di,2
loop l61
add di,2
mov cx,8
l62:
mov [es:di],ax
add di,2
loop l62
sub di,16
mov cx,9
l63:
mov [es:di],ax
add di,160

loop l63
sub di,160
add di,4
mov si,di
mov cx,7
l67:
mov [es:di],ax
sub di,160
loop l67

mov di,si
mov cx,5
l68:
mov [es:di],ax
add di,2
loop l68
sub di,320
sub di,4
mov cx,5
l91:
mov [es:di],ax
add di,2
loop l91
mov [es:di],ax
mov si,di
add di,160
mov cx,4
l92:
mov [es:di],ax
add di,160
loop l92

mov di,si
add di,4
mov si,di
mov [es:di],ax
sub di,320
mov cx,9
l81:
mov [es:di],ax
sub di,2
loop l81
add di,2

mov cx,3
sub di,160
l82:
mov [es:di],ax
sub di,160
loop l82

add di,10
add di,160
mov cx,2
l85:
mov [es:di],ax
add di,160
loop l85

mov di,si
add di,6
add di,320
mov cx,7
l86:
mov [es:di],ax
sub di,160
loop l86
add di,320
add di,2
mov cx,5
l87:
mov [es:di],ax
add di,2
loop l87

add di,480
mov cx,5
l88:
mov [es:di],ax
sub di,2
loop l88

add di,480
mov cx,5
l89:
mov [es:di],ax
add di,2
loop l89


add di,480
mov cx,5
l93:
mov [es:di],ax
sub di,2
loop l93
mov si,di
add di,480
mov cx,5
l94:
mov [es:di],ax
add di,2
loop l94

mov di,si
sub di,28
mov [es:di],ax
add di,160
mov [es:di],ax

mov al,0x15    ;;;;;;;;;;;;;;
mov ah,0x83
mov di,1440
add di,116
mov [es:di],ax

mov al,09
mov ah,0fh
mov di,380
add di,320
mov [es:di],ax

add di,10
add di,800
mov [es:di],ax

mov al,0x4
mov ah,0x4
add di,482
mov [es:di],ax

add di,182
mov [es:di],ax

mov al,0x0e
mov ah,0x0a
sub di,800
mov [es:di],ax

sub di,160
add di,20
mov [es:di],ax
mov al,09
mov ah,0fh
add di,960
mov [es:di],ax

mov al,0x0e
mov ah,0x0a
add di,960
mov [es:di],ax

mov al,0x0e
mov ah,0x0a
sub di,36
sub di,320
mov [es:di],ax
mov al,09
mov ah,0fh
sub di,12
add di,320
mov [es:di],ax

sub di,6
sub di,1600
mov [es:di],ax

mov al,0x4
mov ah,0x4
sub di,20
mov dx,di;;;;;;Storing final location 
mov [es:di],ax
add di,10
sub di,320
mov [es:di],ax
mov al,09
mov ah,0fh
mov di,dx
add di,800
mov [es:di],ax

add di,800
add di,4
mov [es:di],ax

mov al,0x0e
mov ah,0x0a
mov di,358
add di,50
mov [es:di],ax


mov di,3548
add di,32
add di,160
mov dx,di
mov al,0x06
mov ah,0x04
mov [es:di],ax


mov al,0x15   ;;;;;;;;;;;;;;
mov ah,0x83
mov di,2720
add di,78
mov [es:di],ax

mov al,0x02      ;;;;;;;
mov ah,0x8e
mov di,410
add di,800
mov [es:di],ax
mov [supermanIdx],di;Saving index where superman character is placed

pop di
pop cx
pop ax
pop es
pop bp
ret

maze2:
push bp
mov bp,sp
push es
push ax
push cx
push di
mov ax,0xb800
mov es,ax
mov ah,0x22   ;color
mov di,196 ;top
mov si,di
mov cx,36
mov al,'*'
maze2Top:
mov [es:di],ax
add di,2
loop maze2Top
mov bx,di
mov di,si
add di,160  ;left
mov cx,19

maze2Left:
mov [es:di],ax
add di,160
loop maze2Left

sub di,160
mov cx,36

maze2Bottom:
mov [es:di],ax
add di,2
loop maze2Bottom

mov cx,20
maze2Right:
mov [es:di],ax
sub di,160
loop maze2Right

mov di,202
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax

mov di,1796
mov cx,6
hurdle1:
add di,2
mov [es:di],ax
loop hurdle1

mov di,1802
mov cx,6
hurdle2:
sub di,160
mov [es:di],ax
loop hurdle2

add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax

sub di,160
mov [es:di],ax
sub di,160
mov [es:di],ax

add di,6
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
mov si,di
mov [es:di],ax
add di,160
mov [es:di],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add di,160
mov [es:di],ax
mov si,di
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax

add di,160
mov [es:di],ax
add di,160
mov [es:di],ax

sub si,2
mov [es:si],ax
sub si,2
mov [es:si],ax

sub di,6
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
mov si,di
add si,2
mov [es:si],ax
add si,6
mov [es:si],ax

add si,2
mov di,si

mov cx,12
hurdle6:
sub si,160
mov [es:si],ax
loop hurdle6

mov cx,2
mov si,di
hurdle5:
add si,160
mov [es:si],ax
loop hurdle5
sub si,160
add si,2
mov [es:si],ax
add si,160
sub si,6
mov [es:si],ax
sub si,2
mov [es:si],ax
sub si,2
mov [es:si],ax
add si,4
add si,160
mov [es:si],ax
mov cx,9

hurdle7:
add si,2
mov [es:si],ax
loop hurdle7

add si,6
mov [es:si],ax
mov cx,9
hurdle8:
add si,2
mov [es:si],ax
loop hurdle8
add si,160
mov [es:si],ax

mov cx,3
hurdle9:
sub si,160
mov [es:si],ax
loop hurdle9

mov cx,15
hurdle10:
sub si,2
mov [es:si],ax
loop hurdle10
add si,2
mov cx,5
hurdle11:
sub si,160
mov [es:si],ax
loop hurdle11
sub si,2
mov [es:si],ax
add si,160
mov [es:si],ax

add si,320
add si,2
mov cx,14
hurdle12:
add si,2
mov [es:si],ax
loop hurdle12
sub si,640
add si,8
mov cx,10
hurdle13:
sub si,2
mov [es:si],ax
loop hurdle13

add si,320
add si,22
mov cx,15
hurdle14:
sub si,2
mov [es:si],ax
loop hurdle14

mov cx,4
hurdle15:
sub si,160
mov [es:si],ax
loop hurdle15
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
sub si,160
mov [es:si],ax


sub si,4
sub si,160
mov [es:si],ax
sub si,160
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
mov bx,si
mov cx,3
hurdle19:
add si,160
mov [es:si],ax
loop hurdle19
mov cx,4
hurdle20:
add si,2
mov [es:si],ax
loop hurdle20
mov cx,3
hurdle21:
sub si,160
mov [es:si],ax
loop hurdle21
add si,2
mov [es:si],ax
mov si,bx
mov cx,14
hurdle16:
sub si,2
mov [es:si],ax
loop hurdle16
add si,320
mov [es:si],ax
add si,320
mov [es:si],ax
mov cx,4
hurdle17:
add si,2
mov [es:si],ax
loop hurdle17
mov cx,2
hurdle18:
sub si,160
mov [es:si],ax
loop hurdle18
sub di,4
mov [es:di],ax
sub di,2
sub di,2
mov [es:di],ax
add di,160


sub di,6
mov [es:di],ax
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax
sub di,2
sub di,160
mov [es:di],ax

mov cx,5
mov si,di
hurdle3:
add di,160
mov [es:di],ax
loop hurdle3

mov cx,32
hurdle4:
add di,2
mov [es:di],ax
loop hurdle4

add si,480
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax
add si,2
mov [es:si],ax

mov di,518
add di,28
sub di,160
mov dx,di
mov al,79
mov ah,0x04
mov [es:di],ax


mov al,0x04
mov ah,0x04
mov di,0   ;;;;;;
add di,640
add di,52
mov [es:di],ax


mov al,09
mov ah,0fh
add di,36
mov [es:di],ax

mov al,0x0e  
mov ah,0x03
add di,320
sub di,12
mov [es:di],ax
mov si,di
mov al,0x4
mov ah,0x4
add di,480
mov [es:di],ax

mov al,09
mov ah,0fh
sub di,20
add di,320
mov [es:di],ax

mov al,0x0e  
mov ah,0x03
add di,10
add di,320
mov [es:di],ax

mov al,0x4
mov ah,0x4
add di,38
mov [es:di],ax

mov al,09
mov ah,0fh
add di,480
mov [es:di],ax

mov al,0x0e  
mov ah,0x03
sub di,160
sub di,26
mov [es:di],ax

mov al,0x4
mov ah,0x4
add di,320
sub di,24
mov [es:di],ax

mov al,09
mov ah,0fh
add di,320
add di,10
mov [es:di],ax

mov al,0x0e  
mov ah,0x03
add di,26
mov [es:di],ax

mov al,0x4
mov ah,0x4
mov di,si
add di,28
mov [es:di],ax

mov al,09
mov ah,0fh
mov di,si
sub di,30
add di,320
mov [es:di],ax

mov di,1760
add di,56
mov al,0x15
mov ah,0x85
mov [es:di],ax

mov di,960
add di,76
mov [es:di],ax

mov al,0x02      ;;;;;;;
mov ah,0x8e
mov di,2824
mov word[es:di],ax
mov [supermanIdx],di

pop di
pop cx
pop ax
pop es
mov sp,bp
pop bp
ret

maze3:
push bp
mov bp,sp
push es
push ax
push cx
push di
mov ax,0xb800
mov es,ax
mov al,'*'
mov ah,0x44  ;color
mov di,196 ;top
mov si,di
mov cx,40
l136:
mov [es:di],ax
add di,2
loop l136
mov bx,di
mov di,si
add di,160  ;left
mov cx,22
l137:
mov [es:di],ax
add di,160
loop l137
sub di,160  ;bottom
add di,2
mov cx,39
l138:
mov [es:di],ax
add di,2
loop l138
sub di,2
sub di,160
mov cx,21  ;right
l139:
mov [es:di],ax
sub di,160
loop l139
mov di,si
add di,320
add di,2
mov si,di
mov cx,37
l140:
mov [es:di],ax
add di,2
loop l140


sub di,2
mov cx,10
l101:
mov [es:di],ax
add di,160
loop l101

;mov si,di  ;;leftt

add di,2
add di,160
mov cx,7
l102:
mov [es:di],ax
sub di,2
loop l102

add di,12
mov cx,6
l103:
mov [es:di],ax
add di,160
loop l103
sub di,160
sub di,2
mov cx,4
l104:
mov [es:di],ax
sub di,2
loop l104
add di,2

mov dx,di

add di,160
mov [es:di],ax
add di,160
mov [es:di],ax
mov bx,di
add di,6


mov cx,2
l105:
mov [es:di],ax
add di,160
loop l105

mov di,bx
sub di,6
mov cx,4
l106:
mov [es:di],ax
sub di,160
loop l106

mov di,si
add di,4
add di,160
mov cx,4
l107:
mov [es:di],ax
add di,160
loop l107

sub di,160
add di,2
mov cx,8
l108:
mov [es:di],ax
add di,2
loop l108

mov bx,di

mov di,si
add di,6
add di,320
mov [es:di],ax
add di,2
mov [es:di],ax

add di,4
mov cx,12
l109:
mov [es:di],ax
add di,2
loop l109
sub di,2
add di,160
mov cx,4
l110:
mov [es:di],ax
add di,160
loop l110
mov [es:di],ax
add di,2
mov cx,11
l111:
mov [es:di],ax
add di,2
loop l111

mov si,di  ;right lastL

mov di,bx
add di,160
sub di,6
mov cx,6
l112:
mov [es:di],ax
add di,160
loop l112

mov dx,di

mov di,bx
sub di,160
add di,2
mov cx,6
l113:
mov [es:di],ax
add di,160
loop l113
sub di,160
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax

sub di,6
mov cx,4
l114:
mov [es:di],ax
sub di,2
loop l114

add di,320
sub di,6
mov cx,7
l115:
mov [es:di],ax
add di,2
loop l115

add di,4
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax
sub di,10
add di,160
mov cx,4
l116:
mov [es:di],ax
add di,160
loop l116
sub di,160
sub di,2
mov cx,4
l117:
mov [es:di],ax
sub di,2
loop l117

mov bx,di

sub di,320
sub di,2
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax



mov di,bx
add di,2
add di,160
mov cx,2
l118:
mov [es:di],ax
add di,160
loop l118
add di,160
mov cx,12
l119:
mov [es:di],ax
add di,2
loop l119

mov bx,di

sub di,2
add di,160
mov [es:di],ax
sub di,320
mov cx,9
l120:
mov [es:di],ax
sub di,160
loop l120
add di,160
add di,2
mov [es:di],ax

add di,480
sub di,4
mov cx,4
l121:
mov [es:di],ax
sub di,2
loop l121
add di,2
mov cx,5
l122:
mov [es:di],ax
add di,160
loop l122
sub di,8
mov [es:di],ax
sub di,160
mov [es:di],ax

sub di,160
add di,14
mov [es:di],ax
sub di,2
mov [es:di],ax

mov di,si
sub di,18
sub di,320
sub di,160
mov cx,14
l123:
mov [es:di],ax
add di,2
loop l123

mov bx,di
sub di,2
sub di,160
mov [es:di],ax
sub di,160
mov [es:di],ax

sub di,20
sub di,160
mov [es:di],ax
add di,160
mov [es:di],ax
add di,644
mov [es:di],ax
sub di,480
add di,8
mov [es:di],ax
sub di,160
mov [es:di],ax

mov di,bx
add di,158
mov [es:di],ax
add di,160
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax

mov di,si
add di,326
mov cx,16
l124:
mov [es:di],ax
sub di,2
loop l124

add di,6
add di,160
mov dx,di
mov cx,4
l125:
mov [es:di],ax
add di,160
loop l125
sub di,160
add di,2
mov cx,14
l126:
mov [es:di],ax
add di,2
loop l126
mov bx,di;;;;;


mov di,dx
sub di,2
add di,160
mov [es:di],ax
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax


mov di,bx
sub di,160
sub di,2
sub di,12
mov [es:di],ax
sub di,160
mov [es:di],ax
mov bx,di

sub di,160
sub di,8
sub di,2
mov [es:di],ax
add di,160
mov [es:di],ax

mov di,bx
add di,480
sub di,26
mov cx,4
l127:
mov [es:di],ax
add di,2
loop l127
;add di,160
mov cx,6
l128:
mov [es:di],ax
add di,160
loop l128
sub di,160
sub di,320
mov dx,di
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax
mov di,dx
add di,2
mov cx,4
l130:
mov [es:di],ax
add di,2
loop l130
sub di,2
mov dx,di
add di,160
mov [es:di],ax
mov di,dx
sub di,160
mov [es:di],ax
sub di,160
mov [es:di],ax
sub di,160
add di,8
mov cx,4
l131:
mov [es:di],ax
add di,160
loop l131
sub di,160
mov dx,di
add di,2
mov [es:di],ax
mov di,dx
sub di,2
mov [es:di],ax
mov di,dx
add di,320
mov [es:di],ax

mov di,1478
mov cx,6
l135:
mov [es:di],ax
add di,2
loop l135

add di,20
mov bx,di
mov [es:di],ax
sub di,2
mov [es:di],ax
sub di,2
mov [es:di],ax

mov di,bx
add di,30
add di,320
mov [es:di],ax

;mov di,3570
;add di,12
;mov ah,0x07
;mov al,2
;mov [es:di],ax

mov di,3632
shr di,1
mov [position],di
call printAsterisk


mov di,3632

mov al,0x0e   ;;;;;
mov ah,0x02
sub di,10
mov [es:di],ax

mov al,09
mov ah,0fh
sub di,640
mov [es:di],ax

mov al,0x4
mov ah,0x9
sub di,956
mov [es:di],ax

mov al,0x0e   
mov ah,0x02
sub di,640
add di,160
sub di,26
mov [es:di],ax
mov si,di
mov al,09
mov ah,0fh
add di,18
mov [es:di],ax
mov di,si
mov al,09
mov ah,0fh
add di,320
sub di,12
mov dx,di
mov [es:di],ax


mov al,0x4
mov ah,0x9
sub di,800
add di,160
mov [es:di],ax

mov al,0x0e   
mov ah,0x02
sub di,480
add di,24
mov [es:di],ax


mov al,09
mov ah,0fh
sub di,356
mov [es:di],ax

mov al,0x4
mov ah,0x9
mov di,dx
sub di,26
mov [es:di],ax

mov al,0x0e   
mov ah,0x02
mov di,dx
add di,480
mov bx,di
sub di,14
mov [es:di],ax

mov al,09
mov ah,0fh
add di,800
sub di,2
mov [es:di],ax

mov al,0x4
mov ah,0x9
mov di,bx
add di,20
mov [es:di],ax


mov al,0x0e   
mov ah,0x02
add di,800
sub di,320
sub di,6
mov [es:di],ax

mov di,3580
mov dx,di
mov ah,0x02
mov al,0x06
mov [es:di],ax

mov di,1440
add di,98
mov al,0x15  ;;;;;;;;;;;;;;
mov ah,0x8d
mov [es:di],ax

sub di,42
mov [es:di],ax

mov al,0x02      ;;;;;;;
mov ah,0x8e
mov di,320
add di,76
mov [es:di],ax
mov [supermanIdx],di

pop di
pop cx
pop ax
pop es
pop bp
ret

maze4:
push bp
mov bp,sp
push es
push ax
push cx
push di
mov ax,0xb800
mov es,ax
mov al,'*'
mov ah,0x33   ;color
mov di,196 ;top
mov si,di
mov cx,42
l256:
mov [es:di],ax
add di,2
loop l256
mov bx,di
mov di,si
add di,160  ;left
mov cx,22
l257:
mov [es:di],ax
add di,160
loop l257
sub di,160  ;bottom
add di,2
mov cx,41
l258:
mov [es:di],ax
add di,2
loop l258
sub di,2
sub di,160
mov cx,21   ;right
l259:
mov [es:di],ax
sub di,160
loop l259

mov di,bx
sub di,2
add di,640
sub di,2
mov cx,4
l201:
mov [es:di],ax
sub di,2
loop l201
add di,2
mov cx,3
l202:
mov [es:di],ax
sub di,160
loop l202
add di,160
sub di,6

mov si,di ;;space

mov cx,14
l203:
mov [es:di],ax
sub di,2
loop l203

mov dx,di;;;space 2

add di,8
add di,160
mov cx,2
l204:
mov [es:di],ax
add di,160
loop l204
sub di,160
add di,2
mov cx,4
l205:
mov [es:di],ax
add di,2
loop l205
mov [es:di],ax

add di,160
mov cx,2
l206:
mov [es:di],ax
add di,160
loop l206


mov di,si
sub di,2
add di,160
mov cx,4
l207:
mov [es:di],ax
add di,160
loop l207
sub di,160
add di,2
mov cx,5
l208:
mov [es:di],ax
add di,2
loop l208
sub di,2
add di,160
mov cx,2
l209:
mov [es:di],ax
add di,160
loop l209

mov bx,di ;;;leftyyy

sub di,160
sub di,2
mov cx,16
l210:
mov [es:di],ax
sub di,2
loop l210
add di,2

add di,160
mov cx,2
l211:
mov [es:di],ax
add di,160
loop l211
sub di,160
sub di,2
mov cx,2
l212:
mov [es:di],ax
sub di,2
loop l212
mov [es:di],ax

mov cx,3
l213:
mov [es:di],ax
sub di,160
loop l213
add di,160
mov cx,15
l214:
mov [es:di],ax
sub di,2
loop l214

mov si,di;;;;rightyyyy

add di,2
sub di,160
mov cx,6
l215:
mov [es:di],ax
sub di,160
loop l215

add di,160
add di,6
mov cx,4
l216:
mov [es:di],ax
add di,2
loop l216
sub di,2

mov cx,3
add di,160
l217:
mov [es:di],ax
add di,160
loop l217
sub di,320
sub di,10
mov cx,3
l218:
mov [es:di],ax
add di,2
loop l218

add di,320
sub di,2
mov cx,19
l221:
mov [es:di],ax
add di,2
loop l221

mov di,dx
sub di,160
sub di,10
mov cx,4
l222:
mov [es:di],ax
add di,160
loop l222
sub di,160
add di,2
mov cx,4
l223:
mov [es:di],ax
add di,2
loop l223
mov [es:di],ax
add di,160
mov [es:di],ax
sub di,320
sub di,160
sub di,4
mov [es:di],ax
add di,2
mov [es:di],ax
add di,2
mov [es:di],ax

mov di,bx
add di,160
add di,4
mov cx,4
l224:
mov [es:di],ax
sub di,2
loop l224
sub di,164
mov cx,6
l225:
mov [es:di],ax
add di,160
loop l225

mov bx,di 

sub di,160
add di,2
mov cx,3
l226:
mov [es:di],ax
add di,2
loop l226
sub di,2
sub di,160
mov cx,2
l227:
mov [es:di],ax
sub di,160
loop l227

mov di,bx

sub di,160
sub di,2
mov cx,4
l228:
mov [es:di],ax
sub di,2
loop l228
add di,2

mov bx,di;;;;leftttttt

add di,160
mov cx,3
l229:
mov [es:di],ax
add di,160
loop l229

add di,160
sub di,8

mov dx,di;;;;;;upeer
mov cx,9
l230:
mov [es:di],ax
add di,2
loop l230
sub di,2
sub di,160
mov cx,3
l231:
mov [es:di],ax
sub di,160
loop l231
add di,160

add di,2
mov cx,3
l233:
mov [es:di],ax
add di,2
loop l233

add di,480
add di,4
mov cx,4
l234:
mov [es:di],ax
sub di,2
loop l234

mov di,dx
mov cx,10
l236:
mov [es:di],ax
sub di,160
loop l236

add di,160
add di,2
mov cx,4
l237:
mov [es:di],ax
add di,2
loop l237
sub di,2
add di,160
mov cx,2
l238:
mov [es:di],ax
add di,160
loop l238
sub di,160
sub di,10
mov cx,9
l239:
mov [es:di],ax
sub di,2
loop l239
mov [es:di],ax
sub di,160
mov cx,2
l240:
mov [es:di],ax
sub di,160
loop l240
add di,160
sub di,2
mov cx,8
l241:
mov [es:di],ax
sub di,2
loop l241


mov di,si
add di,2
add di,160
mov cx,4
l242:
mov [es:di],ax
add di,160
loop l242
sub di,160
add di,2
mov cx,8
l243:
mov [es:di],ax
add di,2
loop l243
sub di,2
add di,160
mov cx,2
l245:
mov [es:di],ax
add di,160
loop l245
sub di,160

mov si,di ;;;rightyyyy

add di,2
mov cx,6
l246:
mov [es:di],ax
add di,2
loop l246
sub di,2
add di,160
mov cx,3
l247:
mov [es:di],ax
add di,160
loop l247
sub di,160
sub di,2
mov cx,18
l248:
mov [es:di],ax
sub di,2
loop l248

add di,18
add di,160
mov cx,3
l249:
mov [es:di],ax
add di,160
loop l249

sub di,8
mov [es:di],ax
sub di,160
mov [es:di],ax
sub di,160
mov [es:di],ax

mov di,si
sub di,6
mov cx,10
l250:
mov [es:di],ax
sub di,2
loop l250

add di,10
add di,320
mov [es:di],ax

mov di,dx
sub di,8
mov dx,di
mov cx,8
l252:
mov [es:di],ax
sub di,160
loop l252
mov di,dx
sub di,2
mov cx,8
l254:
mov [es:di],ax
sub di,2
loop l254
add di,2
add di,160
mov cx,2
l255:
mov [es:di],ax
add di,160
loop l255

mov di,754
shr di,1
mov [position],di
call printAsterisk
;mov [position],di
;mov ah,0x07
;mov al,2
;mov [es:di],ax
mov di,0
add di,350
add di,4
add di,404
mov dx,di;;;;;

mov al,0x0e  
mov ah,0x02
sub di,12
add di,160
mov [es:di],ax

mov al,09
mov ah,0fh
sub di,26
mov [es:di],ax

mov al,0x4
mov ah,0x4
sub di,40
mov [es:di],ax

mov al,0x0e  
mov ah,0x02
add di,800
mov [es:di],ax

mov al,09
mov ah,0fh
add di,40
mov [es:di],ax

mov al,0x4
mov ah,0x4
add di,20
add di,480
mov [es:di],ax

mov al,0x0e  
mov ah,0x02
add di,14
add di,480
mov [es:di],ax

mov al,09
mov ah,0fh
sub di,22
add di,320
mov [es:di],ax

mov al,0x4
mov ah,0x4
sub di,16
sub di,640
mov si,di
mov [es:di],ax

mov al,0x0e  
mov ah,0x02
sub di,320
sub di,20
mov [es:di],ax


mov al,09
mov ah,0fh
mov di,si
add di,480
sub di,16
mov [es:di],ax

mov al,0x4
mov ah,0x4
add di,320
add di,320
mov [es:di],ax

mov al,0x0e  
mov ah,0x02
add di,20
add di,160
mov [es:di],ax


mov al,09
mov ah,0fh
add di,22
mov [es:di],ax

mov al,0x4
mov ah,0x4
mov di,dx
sub di,320
sub di,30
mov [es:di],ax


mov di,3560
mov dx,di
mov al,0x06
mov ah,0x04
mov [es:di],ax

mov al,0x15    ;;;;;;;;;;;;;;
mov ah,0x8d
mov di,2560
add di,92
mov [es:di],ax

sub di,800
sub di,8
mov [es:di],ax


mov al,0x02      ;;;;;;;
mov ah,0x8e
mov di,320
add di,382
add di,160
mov [es:di],ax
mov [supermanIdx],di


pop di
pop cx
pop ax
pop es
pop bp
ret


GenRandNum:
    push bp
    mov bp, sp
    push cx
    push ax
    push dx

    mov ah, 00h           ; interrupt to get system time
    int 1Ah               ; CX:DX now hold number of clock ticks since midnight
    mov ax, dx            ; move DX (lower 16 bits of ticks) to AX for division
    xor dx, dx            ; clear DX before division
    mov cx, 4             ; set divisor to 4 for range 0 to 3
    div cx                ; AL = quotient, DL = remainder (0 to 3)

    and dl, 3             ; Mask to keep only the lower 2 bits (0 to 3)
    mov byte [randNum], dl  

    pop dx
    pop ax
    pop cx
    pop bp
    ret
	 
; number printing algorithm 
;INES 008-025 FROM EXAMPLE 6.2 (clrscr) ;;;;; 
; subroutine to print a number at top left of screen 
; takes the number to be printed as its parameter 
printnum: push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov ax, [bp+4] ; load number in ax 
 mov bx, 10 ; use base 10 for division 
 mov cx, 0 ; initialize count of digits 
nextdigit: mov dx, 0 ; zero upper half of dividend 
 div bx ; divide by 10 
 add dl, 0x30 ; convert digit into ascii value 
 push dx ; save ascii value on stack 
 inc cx ; increment count of values 
 cmp ax, 0 ; is the quotient zero 
 jnz nextdigit ; if no divide it again 
 mov di, 2060
nextpos: pop dx ; remove a digit from the stack 
 mov dh, 0x07 ; use normal attribute 
 mov [es:di], dx ; print char on screen 
 add di, 2 ; move to next screen location 
 loop nextpos ; repeat for all digits on stack
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 
 pop es 
 pop bp 
 ret 2

printstr: push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push si 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov al, 80 ; load al with columns per row 
 mul byte [bp+10] ; multiply with y position 
 add ax, [bp+12] ; add x position 
 shl ax, 1 ; turn into byte offset 
 mov di,ax ; point di to required location 
 mov si, [bp+6] ; point si to string 
 mov cx, [bp+4] ; load length of string in cx 
 mov ah, [bp+8] ; load attribute in ah 
nextchar: mov al, [si] ; load next char of string 
 mov [es:di], ax ; show this char on screen 
 add di, 2
 add si, 1 ; move to next char in string 
 loop nextchar ; repeat the operation cx times 
 pop di 
 pop si 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10
 
 printscr:

push bp
mov bp,sp
push ax
push bx
push cx
push dx
push si
push di

mov ax,0xb800
mov es,ax
mov di,162
mov si,di
mov al,"*"
mov ah,0x33

mov di,164
mov cx,11
lf:
mov [es:di],ax
call delay
add di,160
loop lf

mov di,166
mov si,di
mov cx,11
la:
mov [es:di],ax
call delay
add di,160
loop la
mov di,si
add di,2
mov cx,6  ;;;
lb:
mov [es:di],ax
call delay
add di,2
loop lb
sub di,2
add di,162
mov cx,4
lc:
mov [es:di],ax
call delay
add di,162
loop lc
sub di,162
sub di,158
mov cx,3
ld:
mov [es:di],ax
call delay
sub di,158
loop ld

mov cx,8
le:
mov [es:di],ax
call delay
add di,2
loop le
mov si,di ;;;;
sub di,2
mov cx,10
add di,160
lg:
mov [es:di],ax
call delay
add di,160
loop lg

sub di,160
sub di,2
mov cx,3
lh:
mov [es:di],ax
call delay
sub di,2
loop lh

add di,2
mov cx,7
sub di,160
li:
mov [es:di],ax
call delay
sub di,160
loop li

add di,160
sub di,2
mov cx,4
lj:
mov [es:di],ax
call delay
sub di,2
loop lj
add di,2

mov cx,5
lk:
mov [es:di],ax
call delay
add di,158
loop lk

sub di,158
mov cx,4
ll:
mov [es:di],ax
call delay
sub di,162
loop ll

mov cx,4
lq:
mov [es:di],ax
call delay
sub di,2
loop lq
add di,2
add di,160
mov cx,7
lw:
mov [es:di],ax
call delay
add di,160
loop lw

sub di,160
sub di,2
mov cx,3
ly:
mov [es:di],ax
call delay
sub di,2
loop ly

mov di,si
mov si,di
mov cx,11
lu:
mov [es:di],ax
call delay
add di,160
loop lu

mov di,si
add di,6
mov si,di
mov cx,11
q1:
mov [es:di],ax
call delay
add di,160
loop q1
mov di,si
add di,2
mov cx,11
q2:
mov [es:di],ax
call delay
add di,160
loop q2
mov di,si
add di,4
mov cx,12
q3:
mov [es:di],ax
call delay
add di,2
loop q3
sub di,2
add di,160
mov cx,10
lq4:
mov [es:di],ax
call delay
add di,160
loop lq4

mov si,di;;;;

sub di,160
sub di,2
mov cx,4
lq5:
mov [es:di],ax
call delay
sub di,2
loop lq5
add di,160
add di,2
sub di,160
mov cx,5
lq6:
mov [es:di],ax
call delay
sub di,160
loop lq6
add di,160
mov bx,di;;;;
sub di,2
mov cx,4
lq7:
mov [es:di],ax
sub di,2
loop lq7
add di,2
add di,160
mov cx,4
lq8:
mov [es:di],ax
add di,160
loop lq8
sub di,160
sub di,2
mov cx,3
lq9:
mov [es:di],ax
call delay
sub di,2
loop lq9

mov di,bx
sub di,320
mov cx,5
u1:
mov [es:di],ax
call delay
sub di,2
loop u1
add di,2
mov cx,2
sub di,160
lu2:
mov [es:di],ax
call delay
sub di,160
loop lu2
add di,160
add di,2
mov cx,4
u4:
mov [es:di],ax
call delay
add di,2
loop u4
sub di,2
mov cx,2
add di,160
u5:
mov [es:di],ax
call delay
add di,160
loop u5

mov di,si
add di,2
sub di,160
mov cx,11
u6:
mov [es:di],ax
call delay
sub di,160
loop u6

;;;zzzzzzzz
add di,158
add di,8;;;;;
mov dx,di   
    ;;;;;
mov cx,13
e1:
mov [es:di],ax
call delay
add di,2
loop e1
mov si,di
mov bx,di ;;;;
mov di,dx
add di,160
mov cx,2
h1:
mov [es:di],ax
call delay
add di,160
loop h1
sub di,160

add di,2
mov cx,6;;;
h2:
mov [es:di],ax
call delay
add di,2
loop h2
;;;;;;;down
sub di,2
add di,160
mov cx,7            ;;;
h4:
mov [es:di],ax
call delay
add di,158
loop h4

sub di,158
add di,160
mov [es:di],ax
call delay
add di,2
mov cx,12 ;;;;
h9:
mov [es:di],ax
call delay
add di,2
loop h9

mov dx,di

mov di,bx
sub di,2
add di,160
mov cx,8
o1:
mov [es:di],ax
call delay
add di,158
loop o1

mov di,dx
sub di,2
sub di,160
mov cx,2
r1:
mov [es:di],ax
call delay
sub di,160
loop r1
add di,160
sub di,2
mov cx,6
p1:
mov [es:di],ax
call delay
sub di,2
loop p1


mov di,si   ;;;;;;;;;;

add di,6
mov si,di
mov cx,11
p2:
mov [es:di],ax
call delay
add di,160
loop p2
mov di,si
add di,2
mov si,di ;;;;;;
mov cx,11
p3:
mov [es:di],ax
call delay
add di,160
loop p3

mov di,si
add di,2
mov cx,10
p4:
mov [es:di],ax
call delay
add di,2
loop p4
sub di,2
add di,160
mov cx,2
lp5:
mov [es:di],ax
call delay
add di,160
loop lp5
sub di,160
mov cx,7                 ;;;;;;;;;;;;;;;;;;
p6:
mov [es:di],ax
call delay
sub di,2
loop p6
add di,2
mov cx,2
add di,160
lp7:
mov [es:di],ax
call delay
add di,160
loop lp7

sub di,160
add di,2
mov cx,6              ;;;;;;;;;;;;;
lp8:
mov [es:di],ax
call delay
add di,2
loop lp8
sub di,2

add di,160
mov cx,2
lp9:
mov [es:di],ax
call delay
add di,160
loop lp9


sub di,160
sub di,2
mov cx,6 ;;;;;;;;;;;;;;;;;;;;;;
p7:
mov [es:di],ax
call delay
sub di,2
loop p7
add di,2
add di,160
mov cx,2
p8:
mov [es:di],ax
call delay
add di,160
loop p8
sub di,160
add di,2
mov cx,6
lo1:
mov [es:di],ax
call delay
add di,2
loop lo1
sub di,2
add di,160
mov cx,2
lo2:
mov [es:di],ax
call delay
add di,160
loop lo2
sub di,160
sub di,2
mov cx,9
ko1:
mov [es:di],ax
call delay
sub di,2
loop ko1

;; box
mov di,0
sub di,640
mov si,di
mov cx,2
l57:
mov [es:di],ax
call delay
add di,4
loop l57

mov cx,3
l58:
mov [es:di],ax
call delay
add di,160
loop l58

sub di,160
mov cx,2
l59:
mov [es:di],ax
call delay
sub di,4
loop l59

mov cx,3
ldf:
mov [es:di],ax
call delay
sub di,160
loop ldf

;; rectangle

mov di,2080
mov si,di
mov dx,di
lgghh:
mov word[es:di],0x8020 ;96
add di,2
cmp di,3520
jne lgghh

mov di,si
mov cx,80
mov ah,0b00010111
lkkoo:
mov [es:di],ax
call delay
add di,2
loop lkkoo


mov cx,8
lll:
mov [es:di],ax
call delay
add di,160
loop lll

mov cx,80
iioo:
mov [es:di],ax
call delay
add di,2
loop iioo

sub di,1500
add di,58
mov cx,9
l64:
mov[es:di],ax
call delay
add di,160
loop l64

;; button
mov di,dx
add di,168
add di,160
mov si,di
mov ah,0x07
mov cx,13
l65:
mov [es:di],ax
call delay
add di,4
loop l65
mov bx,di
mov di,si
add di,160
mov cx,4
l66:
mov [es:di],ax
call delay
add di,160
loop l66

mov cx,12
jutt:
mov[es:di],ax
call delay
add di,4
loop jutt

mov cx,5
but:
mov[es:di],ax
call delay
sub di,160
loop but


;;;p
mov di,si
add di,164
mov si,di
mov cx,4
mov ah,0x55 ;;0x22
l69:
mov[es:di],ax
call delay
add di,160
loop l69

mov di,si
mov cx,4
l70:
mov [es:di],ax
call delay
add di,2
loop l70
mov si,di

add di,158
mov cx,2
l71:
mov [es:di],ax
call delay
add di,160
loop l71

sub di,160
mov cx,3
l72:
mov [es:di],ax
call delay
sub di,2
loop l72

mov di,si
add di,2
mov si,di
mov cx,4
l73:
mov [es:di],ax
call delay
add di,160
loop l73

sub di,160
mov cx,3
l74:
mov [es:di],ax
call delay
add di,2
loop l74

;;; A
mov di,si
add di,14
mov si,di
mov cx,4
l75:
mov [es:di],ax
call delay
add di,158
loop l75

mov di,si
mov cx,4
l76:
mov [es:di],ax
call delay
add di,162
loop l76

mov di,si
add di,318
mov cx,3
l77:
mov [es:di],ax
call delay
add di,2
loop l77

;; Y

mov di,si
add di,8
mov [es:di],ax
call delay
mov cx,3
l78:
mov [es:di],ax
call delay
add di,162
loop l78

mov si,di
mov cx,2
sub di,160
sub di,160
l79:
mov [es:di],ax
call delay
sub di,158
loop l79

mov di,si
sub di,2
mov [es:di],ax

;;; next buttton
mov di,bx
add di,2
mov si,di
mov dx,di
mov ah,0x07
mov cx,11
l80:
mov [es:di],ax
call delay
add di,4
loop l80

mov di,si
add di,160
mov cx,6
kut:
mov [es:di],ax
call delay
add di,160
loop kut

sub di,160
mov cx,10
bhat:
mov [es:di],ax
call delay
add di,4
loop bhat

mov cx ,6
l83:
mov [es:di],ax
call delay
sub di,160
loop l83

;; E

mov ah,0b01000100
mov di,dx
add di,164
mov dx,di
mov cx,5
l84:
mov [es:di],ax
call delay
add di,160
loop l84

mov di,dx
mov cx,3
jut:
mov [es:di],ax
call delay
add di,2
loop jut
mov si,di

add di,316
mov cx,2
cut:
mov [es:di],ax
call delay
add di,2
loop cut

add di,316
mov cx,2
zz:
mov [es:di],ax
call delay
add di,2
loop zz

;;; x

mov di,si
add di,2
mov si,di
mov cx,5
min:
mov [es:di],ax
add di,162
loop min

add si,10
mov di,si
mov si,di
mov cx,5
nn:
mov [es:di],ax
call delay
add di,158
loop nn


;;; i
add si,4
mov di,si
mov cx,3
l90:
mov [es:di],ax
call delay
add di,2
loop l90

mov si,di

add di,156
mov cx,3
kkk:
mov [es:di],ax
call delay
add di,160
loop kkk
sub di,2
mov cx,3
ppoo:
mov [es:di],ax
call delay
add di,2
loop ppoo

;;;t

add si,2
mov di,si
mov [es:di],ax
call delay
mov cx,3

yy:
mov [es:di],ax
call delay
add di,2
loop yy

mov si,di

add di,156
mov cx,4
ff:
mov [es:di],ax
call delay
add di,160
loop ff

;;; button 3
mov ah,0x07
add si,6
sub si,160
mov di,si
mov si,di
mov dx,di
mov cx,11
l95:
mov [es:di],ax
call delay
add di,4
loop l95

mov di,si
mov cx,6
l96:
mov [es:di],ax
call delay
add di,160
loop l96

sub di,160
mov cx,10
l97:
mov [es:di],ax
call delay
add di,4
loop l97

mov cx,5
l98:
mov [es:di],ax
call delay
sub di,160
loop l98

mov ah,0x22

mov di,dx
add di,164
mov cx,3
l99:
mov [es:di],ax
call delay
add di,2
loop l99

mov si,di

add di,156
mov cx,2
l100:
mov [es:di],ax
call delay
add di,160
loop l100

sub di,2
mov cx,3
ggg:
mov [es:di],ax
call delay
add di,2
loop ggg


;;; n
mov di,si
add di,2
mov si,di
mov cx,4
hhh:
mov [es:di],ax
call delay
add di,160
loop hhh

mov di,si
add di,162
mov cx,3
wawa:
mov [es:di],ax
call delay
add di,162
loop wawa

sub di,322
mov cx,3
rrrr:
mov [es:di],ax
call delay
sub di,160
loop rrrr

add di,4
mov si,di
add di,160
mov cx,4
rr:
mov [es:di],ax
call delay
add di,160
loop rr


mov di,si
add di,160
mov cx,3
tt:
mov [es:di],ax
call delay
add di,2
loop tt

mov si,di

add di,316
mov cx,2
s107:
mov [es:di],ax
call delay
add di,2
loop s107

mov di,si
add di,2
mov cx,4
s108:
mov [es:di],ax
call delay
add di,2
loop s108

add di,158
mov cx,3
s109:
mov [es:di],ax
call delay
add di,160
loop s109

sub di,160
mov cx,3
s110:
mov [es:di],ax
call delay
sub di,2
loop s110

mov cx,4
s111:
mov [es:di],ax
call delay
sub di,160
loop s111

mov di,3680
l161:
mov word[es:di],0x0020
add di,2
cmp di,4000
jne l161

    pop di
	pop si
	pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 2
 
 delay:
push cx
mov cx, 1; change the values to increase delay time
delay_loop1:
push cx
mov cx, 0xFFFF
delay_loop2:
loop delay_loop2
pop cx
loop delay_loop1
pop cx
ret
 
 
 printnumForTimer:
 push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov ax, [bp+4] ; load number in ax
mov bx, 10 ; use base 10 for division
mov cx, 0 ; initialize count of digits
nextdigitInTimer:
 mov dx, 0 ; zero upper half of dividend
 mov si,ax
div bx ; divide by 10
add dl, 0x30 ; convert digit into ascii value
push dx ; save ascii value on stack
inc cx ; increment count of values
cmp ax,10
jl setDI
jmp cmpWithZero
setDI:
mov word [es:942],0x0020
mov word [es:944],0x0020
mov word [es:946],0x0020

cmpWithZero:
cmp ax, 0 ; is the quotient zero
jnz nextdigitInTimer ; if no divide it again

mov di, 940 ; point di to 70th column
jmp nextposInTimer

nextposInTimer: pop dx ; remove a digit from the stack
mov dh, 0x07 ; use normal attribute
mov [es:di], dx ; print char on screen
add di, 2 ; move to next screen location
loop nextposInTimer ; repeat for all digits on stack
mov word[tickDelay],18
pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2
; timer interrupt service routine
timer: 
dec word[tickDelay]
push ax
cmp word[tickDelay],0
je decrementCounter
jmp endOfInter
decrementCounter:
dec word [cs:tickcount];decrement tick count
cmp word[cs:tickcount],0
je endscr2
push word [cs:tickcount]
call printnumForTimer ; print tick count
endOfInter:
mov al, 0x20
out 0x20, al ; end of interrupt
pop ax

iret



printnum2: push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov ax, [bp+4] ; load number in ax 
 mov bx, 10 ; use base 10 for division 
 mov cx, 0 ; initialize count of digits 
nextdigit3: mov dx, 0 ; zero upper half of dividend 
 div bx ; divide by 10 
 add dl, 0x30 ; convert digit into ascii value 
 push dx ; save ascii value on stack 
 inc cx ; increment count of values 
 cmp ax, 0 ; is the quotient zero 
 jnz nextdigit3 ; if no divide it again 
 mov di, 3020

nextpos3: pop dx ; remove a digit from the stack 
 mov dh, 0x07 ; use normal attribute 
 mov [es:di], dx ; print char on screen 
 add di, 2 ; move to next screen location 
 loop nextpos3 ; repeat for all digits on stack
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax 
 pop es 
 pop bp 
 ret 2 

infoPage:
push bp
mov bp,sp
push ax
push bx
push cx
push dx
push es

mov ah,0x13
mov al,1
mov bh,0	
mov bl,5
mov dx,0x0346
mov cx,34
push cs
pop es
mov bp,infoText
int 0x10

pop es
pop dx
pop cx
pop bx
pop ax
mov sp,bp
pop bp
ret
start:
call clrscr


printingMenu:
mov ax,"*"
push ax
call printscr

              mov  ax, 26    
              push ax                 ; push x position  
              mov  ax, 23
              push ax                 ; push y position  
              mov  ax, 0b00000111             ; blue on black attribute 
              push ax                 ; push attribute  
              mov  ax, message2
              push ax                 ; push address of message 
              push word [length2]      ; push message length 
              call printstr
			  
userInputsInMenu:
mov ah,0
int 0x16
cmp al,0x70;;;;If p is pressed then it will take to game play
je lep
cmp al,0x69;;;;If i is pressed it will show infoabout game(controls and rewards info)
je printInfo
cmp al,0x65;;;;If user presses e in menu then game will end
je end2
jmp userInputsInMenu
lep:
call clrscr
;;;;;;;;;;;;;;Pattern for score,time and health
             mov ax,0xb800
                          mov ax,0xb800
			 mov es,ax
			 
			 mov di,448
			 sub di,160
			 mov al,"*"
			 mov ah,0x07
			 mov cx,14
			 pp:
			 mov [es:di],ax
			 add di,2
			 loop pp
			 sub di,2
			 add di,160
			 mov cx,20
			 oo:
			 	 mov [es:di],ax
				 add di,160
				 loop oo
          sub di,160
		  mov cx,13
		  sub di,2
		  ii:
		  	 mov [es:di],ax
			 sub di,2
			 loop ii
			 add di,2
			 mov cx,19
			 sub di,160
			 mm:
			 	 mov [es:di],ax
				 sub di,160
				 loop mm
				 
				mov di,1408
				sub di,160
				mov cx,12
				add di,2
				gg:
					 mov [es:di],ax
					 add di,2
					 loop gg
					 
					 mov di,2368
					 add di,2
					 mov cx,12
					 dd:
					 	 mov [es:di],ax
						 add di,2 
						 loop dd    
        mov  ax, 69
              push ax                 ; push x position  
              mov  ax, 3
              push ax                 ; push y position  
              mov  ax, 0b00000011            ; blue on black attribute 
              push ax                 ; push attribute  
              mov  ax, message4
              push ax                 ; push address of message 
              push word [length4]      ; push message length 
              call printstr


              mov  ax, 68
              push ax                 ; push x position  
              mov  ax, 16
              push ax                 ; push y position  
              mov  ax, 0b10000010             ; blue on black attribute 
              push ax                 ; push attribute  
              mov  ax, message3
              push ax                 ; push address of message 
              push word [length3]      ; push message length 
              call printstr
			  
mov ax,[health]
push ax
call printnum2
 
mov ax, 69
 push ax ; push x position 
 mov ax, 10
 push ax ; push y position 
 mov ax, 4 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, message 
 push ax ; push address of message 
 push word [length]
call printstr
mov ax, 0
 push ax ; place number on stack 
 call printnum 
call GenRandNum
cmp word[randNum],0
je drawMaze1
cmp word[randNum],1
je drawMaze2
cmp word[randNum],2
je drawMaze3
cmp word[randNum],3
je drawMaze4
drawMaze1:
call maze1
jmp exit

drawMaze2:
call maze2
jmp exit

drawMaze3:
call maze3
jmp exit

drawMaze4:
call maze4

exit:

xor ax, ax
mov es, ax ; point es to IVT base
cli ; disable interrupts

mov word [es:8*4], timer; store offset at n*4
mov [es:8*4+2], cs ; store segment at n*4+2
sti
push es
xor ax, ax
mov es, ax
mov ax, [es:80h*4]
mov [oldISR], ax
mov ax, [es:80h*4+2]
mov [oldISR+2], ax
pop es
cli
push es
xor ax, ax
mov es, ax
mov word [es:80h*4], customISR
mov [es:80h*4+2], cs
pop es
sti
;call clrscr
call printAsterisk
mainloop:
int 80h
mov ah, 1
int 0x16
jz mainloop
mov ah, 0
int 0x16
cmp al, 0x1b
jne mainloop
cli
push es
xor ax, ax
mov es, ax
mov ax, [oldISR]
mov [es:80h*4], ax
mov ax, [oldISR+2]
mov [es:80h*4+2], ax
pop es
sti

printInfo:

call clrscr
mov ah,0x13
mov al,0
mov bh,0	
mov bl,40
mov dx,0x0315
mov cx,34
push cs
pop es
mov bp,infoText
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,2
mov dx,0x0400
mov cx,53
push cs
pop es
mov bp,line1
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,3
mov dx,0x0503
mov cx,54
push cs
pop es
mov bp,line2
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,3
mov dx,0x0603
mov cx,58
push cs
pop es
mov bp,line3
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,3
mov dx,0x0703
mov cx,56
push cs
pop es
mov bp,line4
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,3
mov dx,0x0803
mov cx,56
push cs
pop es
mov bp,line5
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,10
mov dx,0x0900
mov cx,70
push cs
pop es
mov bp,line6
int 0x10
mov ah,0x13
mov al,0
mov bh,0	
mov bl,14
mov dx,0x0A00
mov cx,68
push cs
pop es
mov bp,line7
int 0x10

int 0x10
mov ah,0x13
mov al,0
mov bh,0	
mov bl,2
mov dx,0x0B00
mov cx,24
push cs
pop es
mov bp,line8
int 0x10

int 0x10
mov ah,0x13
mov al,0
mov bh,0	
mov bl,4
mov dx,0x0c00
mov cx,100
push cs
pop es
mov bp,superManModeLine
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,16
mov dx,0x0e20
mov cx,12
push cs
pop es
mov bp,line9
int 0x10

;mov word[es:2120],0x0e02
int 0x10
mov ah,0x13
mov al,0
mov bh,0	
mov bl,14
mov dx,0x0f18
mov cx,26
push cs
pop es
mov bp,line10
int 0x10


int 0x10
mov ah,0x13
mov al,0
mov bh,0	
mov bl,13
mov dx,0x1118
mov cx,26
push cs
pop es
mov bp,line11
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,15
mov dx,0x1318
mov cx,26
push cs
pop es
mov bp,line12
int 0x10

mov ah,0x13
mov al,0
mov bh,0	
mov bl,15
mov dx,0x1615
mov cx,31
push cs
pop es
mov bp,line13
int 0x10

mov ax,0xb800
mov es,ax
mov di,2762
mov word[es:di],0x0509
mov di,3082
mov word[es:di],0x0704
mov di,2442
mov word[es:di],0x0e0e
int 0x10
keepCheckingb:
mov ah,00h
int 16h
cmp al,98
je backToMenu
jmp keepCheckingb

backToMenu:
call clrscr
jmp printingMenu

end:
mov ax,0x4c00
int 0x21

mov dx, start ; end of resident portion
add dx, 15 ; round up to next para
mov cl, 4
shr dx, cl ; number of paras
mov ax, 0x3100 ; terminate and stay resident
int 0x21
end2:
call clrscr
jmp end
