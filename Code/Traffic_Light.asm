
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Traffic_Light.c,26 :: 		void interrupt(){
;Traffic_Light.c,27 :: 		if(INTF_bit==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
;Traffic_Light.c,28 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;Traffic_Light.c,29 :: 		counter2++;
	INCF       _counter2+0, 1
;Traffic_Light.c,30 :: 		}
L_interrupt0:
;Traffic_Light.c,31 :: 		}
L_end_interrupt:
L__interrupt99:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_Manual:

;Traffic_Light.c,32 :: 		void Manual(){
;Traffic_Light.c,34 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual1
;Traffic_Light.c,35 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,36 :: 		}
L_Manual1:
;Traffic_Light.c,37 :: 		if(counter>3){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Manual2
;Traffic_Light.c,38 :: 		counter=0;
	CLRF       _counter+0
;Traffic_Light.c,39 :: 		}
L_Manual2:
;Traffic_Light.c,40 :: 		switch(counter){
	GOTO       L_Manual3
;Traffic_Light.c,42 :: 		case(0):
L_Manual5:
;Traffic_Light.c,43 :: 		SOUTH_RED=0;
	BCF        PORTD+0, 0
;Traffic_Light.c,44 :: 		WEST_RED=0;
	BCF        PORTD+0, 3
;Traffic_Light.c,45 :: 		SOUTH_YELLOW=0;
	BCF        PORTD+0, 1
;Traffic_Light.c,46 :: 		WEST_YELLOW=0;
	BCF        PORTD+0, 4
;Traffic_Light.c,47 :: 		SOUTH_GREEN=0;
	BCF        PORTD+0, 2
;Traffic_Light.c,48 :: 		WEST_GREEN=0;
	BCF        PORTD+0, 5
;Traffic_Light.c,49 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual6
;Traffic_Light.c,50 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,51 :: 		break;
	GOTO       L_Manual4
;Traffic_Light.c,52 :: 		}
L_Manual6:
;Traffic_Light.c,54 :: 		for(i=20;i>=0;i--){
	MOVLW      20
	MOVWF      _i+0
L_Manual7:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Manual8
;Traffic_Light.c,55 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual10
;Traffic_Light.c,56 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,57 :: 		break;
	GOTO       L_Manual8
;Traffic_Light.c,58 :: 		}
L_Manual10:
;Traffic_Light.c,59 :: 		SOUTH_RED=1;
	BSF        PORTD+0, 0
;Traffic_Light.c,60 :: 		WEST_GREEN=1;
	BSF        PORTD+0, 5
;Traffic_Light.c,62 :: 		Left_Number= (i+3)/10;
	MOVLW      3
	ADDWF      _i+0, 0
	MOVWF      FLOC__Manual+0
	MOVLW      0
	BTFSC      _i+0, 7
	MOVLW      255
	MOVWF      FLOC__Manual+1
	BTFSC      STATUS+0, 0
	INCF       FLOC__Manual+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Manual+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Manual+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,63 :: 		Right_Number=(i+3)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Manual+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Manual+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,64 :: 		Left_Number2=(i)/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,65 :: 		Right_Number2=(i)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,67 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Manual11:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Manual12
;Traffic_Light.c,68 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual14
;Traffic_Light.c,69 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,70 :: 		break;
	GOTO       L_Manual12
;Traffic_Light.c,71 :: 		}
L_Manual14:
;Traffic_Light.c,72 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,73 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,74 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,75 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,76 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,77 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual15:
	DECFSZ     R13+0, 1
	GOTO       L_Manual15
	DECFSZ     R12+0, 1
	GOTO       L_Manual15
	NOP
	NOP
;Traffic_Light.c,79 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,80 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,81 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,82 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,83 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,84 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual16:
	DECFSZ     R13+0, 1
	GOTO       L_Manual16
	DECFSZ     R12+0, 1
	GOTO       L_Manual16
	NOP
	NOP
;Traffic_Light.c,86 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,87 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,88 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,89 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,90 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,91 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual17:
	DECFSZ     R13+0, 1
	GOTO       L_Manual17
	DECFSZ     R12+0, 1
	GOTO       L_Manual17
	NOP
	NOP
;Traffic_Light.c,93 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,94 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,95 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,96 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,97 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,98 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual18:
	DECFSZ     R13+0, 1
	GOTO       L_Manual18
	DECFSZ     R12+0, 1
	GOTO       L_Manual18
	NOP
	NOP
;Traffic_Light.c,67 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,99 :: 		}
	GOTO       L_Manual11
L_Manual12:
;Traffic_Light.c,54 :: 		for(i=20;i>=0;i--){
	DECF       _i+0, 1
;Traffic_Light.c,100 :: 		}
	GOTO       L_Manual7
L_Manual8:
;Traffic_Light.c,101 :: 		case(1):
L_Manual19:
;Traffic_Light.c,102 :: 		WEST_YELLOW=1;
	BSF        PORTD+0, 4
;Traffic_Light.c,103 :: 		WEST_GREEN=0;
	BCF        PORTD+0, 5
;Traffic_Light.c,105 :: 		for(i=3;i>=0;i--){
	MOVLW      3
	MOVWF      _i+0
L_Manual20:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Manual21
;Traffic_Light.c,106 :: 		Left_Number= (i)/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Manual+0
	MOVF       FLOC__Manual+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,107 :: 		Right_Number=(i)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,108 :: 		Left_Number2=(i)/10;
	MOVF       FLOC__Manual+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,109 :: 		Right_Number2=(i)%10;
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,111 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Manual23:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Manual24
;Traffic_Light.c,113 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,114 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,115 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,116 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,117 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,118 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual26:
	DECFSZ     R13+0, 1
	GOTO       L_Manual26
	DECFSZ     R12+0, 1
	GOTO       L_Manual26
	NOP
	NOP
;Traffic_Light.c,120 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,121 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,122 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,123 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,124 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,125 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual27:
	DECFSZ     R13+0, 1
	GOTO       L_Manual27
	DECFSZ     R12+0, 1
	GOTO       L_Manual27
	NOP
	NOP
;Traffic_Light.c,127 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,128 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,129 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,130 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,131 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,132 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual28:
	DECFSZ     R13+0, 1
	GOTO       L_Manual28
	DECFSZ     R12+0, 1
	GOTO       L_Manual28
	NOP
	NOP
;Traffic_Light.c,134 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,135 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,136 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,137 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,138 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,139 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual29:
	DECFSZ     R13+0, 1
	GOTO       L_Manual29
	DECFSZ     R12+0, 1
	GOTO       L_Manual29
	NOP
	NOP
;Traffic_Light.c,111 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,140 :: 		}
	GOTO       L_Manual23
L_Manual24:
;Traffic_Light.c,105 :: 		for(i=3;i>=0;i--){
	DECF       _i+0, 1
;Traffic_Light.c,141 :: 		}
	GOTO       L_Manual20
L_Manual21:
;Traffic_Light.c,142 :: 		case(2):
L_Manual30:
;Traffic_Light.c,143 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual31
;Traffic_Light.c,144 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,145 :: 		break;
	GOTO       L_Manual4
;Traffic_Light.c,146 :: 		}
L_Manual31:
;Traffic_Light.c,147 :: 		WEST_YELLOW=0;
	BCF        PORTD+0, 4
;Traffic_Light.c,148 :: 		SOUTH_RED=0;
	BCF        PORTD+0, 0
;Traffic_Light.c,149 :: 		WEST_RED=1;
	BSF        PORTD+0, 3
;Traffic_Light.c,150 :: 		SOUTH_GREEN=1;
	BSF        PORTD+0, 2
;Traffic_Light.c,151 :: 		for(i=12;i>=0;i--){
	MOVLW      12
	MOVWF      _i+0
L_Manual32:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Manual33
;Traffic_Light.c,152 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual35
;Traffic_Light.c,153 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,154 :: 		break;
	GOTO       L_Manual33
;Traffic_Light.c,155 :: 		}
L_Manual35:
;Traffic_Light.c,157 :: 		Left_Number= (i)/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,158 :: 		Right_Number=(i)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,159 :: 		Left_Number2=(i+3)/10;
	MOVLW      3
	ADDWF      _i+0, 0
	MOVWF      FLOC__Manual+0
	MOVLW      0
	BTFSC      _i+0, 7
	MOVLW      255
	MOVWF      FLOC__Manual+1
	BTFSC      STATUS+0, 0
	INCF       FLOC__Manual+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Manual+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Manual+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,160 :: 		Right_Number2=(i+3)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Manual+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Manual+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,162 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Manual36:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Manual37
;Traffic_Light.c,163 :: 		if(manual==0){
	BTFSC      PORTB+0, 1
	GOTO       L_Manual39
;Traffic_Light.c,164 :: 		counter++;
	INCF       _counter+0, 1
;Traffic_Light.c,165 :: 		break;
	GOTO       L_Manual37
;Traffic_Light.c,166 :: 		}
L_Manual39:
;Traffic_Light.c,168 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,169 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,170 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,171 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,172 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,173 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual40:
	DECFSZ     R13+0, 1
	GOTO       L_Manual40
	DECFSZ     R12+0, 1
	GOTO       L_Manual40
	NOP
	NOP
;Traffic_Light.c,175 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,176 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,177 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,178 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,179 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,180 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual41:
	DECFSZ     R13+0, 1
	GOTO       L_Manual41
	DECFSZ     R12+0, 1
	GOTO       L_Manual41
	NOP
	NOP
;Traffic_Light.c,182 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,183 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,184 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,185 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,186 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,187 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual42:
	DECFSZ     R13+0, 1
	GOTO       L_Manual42
	DECFSZ     R12+0, 1
	GOTO       L_Manual42
	NOP
	NOP
;Traffic_Light.c,189 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,190 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,191 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,192 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,193 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,194 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual43:
	DECFSZ     R13+0, 1
	GOTO       L_Manual43
	DECFSZ     R12+0, 1
	GOTO       L_Manual43
	NOP
	NOP
;Traffic_Light.c,162 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,195 :: 		}
	GOTO       L_Manual36
L_Manual37:
;Traffic_Light.c,151 :: 		for(i=12;i>=0;i--){
	DECF       _i+0, 1
;Traffic_Light.c,196 :: 		}
	GOTO       L_Manual32
L_Manual33:
;Traffic_Light.c,197 :: 		case(3):
L_Manual44:
;Traffic_Light.c,198 :: 		SOUTH_GREEN=0;
	BCF        PORTD+0, 2
;Traffic_Light.c,199 :: 		SOUTH_YELLOW=1;
	BSF        PORTD+0, 1
;Traffic_Light.c,201 :: 		for(i=3;i>=0;i--){
	MOVLW      3
	MOVWF      _i+0
L_Manual45:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Manual46
;Traffic_Light.c,202 :: 		Left_Number= (i)/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Manual+0
	MOVF       FLOC__Manual+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,203 :: 		Right_Number=(i)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,204 :: 		Left_Number2=(i)/10;
	MOVF       FLOC__Manual+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,205 :: 		Right_Number2=(i)%10;
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,207 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Manual48:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Manual49
;Traffic_Light.c,209 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,210 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,211 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,212 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,213 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,214 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual51:
	DECFSZ     R13+0, 1
	GOTO       L_Manual51
	DECFSZ     R12+0, 1
	GOTO       L_Manual51
	NOP
	NOP
;Traffic_Light.c,216 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,217 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,218 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,219 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,220 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,221 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual52:
	DECFSZ     R13+0, 1
	GOTO       L_Manual52
	DECFSZ     R12+0, 1
	GOTO       L_Manual52
	NOP
	NOP
;Traffic_Light.c,223 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,224 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,225 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,226 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,227 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,228 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual53:
	DECFSZ     R13+0, 1
	GOTO       L_Manual53
	DECFSZ     R12+0, 1
	GOTO       L_Manual53
	NOP
	NOP
;Traffic_Light.c,230 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,231 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,232 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,233 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,234 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,235 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Manual54:
	DECFSZ     R13+0, 1
	GOTO       L_Manual54
	DECFSZ     R12+0, 1
	GOTO       L_Manual54
	NOP
	NOP
;Traffic_Light.c,207 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,236 :: 		}
	GOTO       L_Manual48
L_Manual49:
;Traffic_Light.c,201 :: 		for(i=3;i>=0;i--){
	DECF       _i+0, 1
;Traffic_Light.c,237 :: 		}
	GOTO       L_Manual45
L_Manual46:
;Traffic_Light.c,238 :: 		break;
	GOTO       L_Manual4
;Traffic_Light.c,240 :: 		}
L_Manual3:
	MOVF       _counter+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Manual5
	MOVF       _counter+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Manual19
	MOVF       _counter+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Manual30
	MOVF       _counter+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Manual44
L_Manual4:
;Traffic_Light.c,241 :: 		}
L_end_Manual:
	RETURN
; end of _Manual

_Automatic:

;Traffic_Light.c,242 :: 		void Automatic(){
;Traffic_Light.c,243 :: 		SOUTH_RED=0;
	BCF        PORTD+0, 0
;Traffic_Light.c,244 :: 		WEST_RED=0;
	BCF        PORTD+0, 3
;Traffic_Light.c,245 :: 		SOUTH_YELLOW=0;
	BCF        PORTD+0, 1
;Traffic_Light.c,246 :: 		WEST_YELLOW=0;
	BCF        PORTD+0, 4
;Traffic_Light.c,247 :: 		SOUTH_GREEN=0;
	BCF        PORTD+0, 2
;Traffic_Light.c,248 :: 		WEST_GREEN=0;
	BCF        PORTD+0, 5
;Traffic_Light.c,249 :: 		for(i=38;i>=0;i--){
	MOVLW      38
	MOVWF      _i+0
L_Automatic55:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Automatic56
;Traffic_Light.c,250 :: 		if(i>18){
	MOVLW      128
	XORLW      18
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic58
;Traffic_Light.c,251 :: 		SOUTH_RED=1;
	BSF        PORTD+0, 0
;Traffic_Light.c,252 :: 		WEST_GREEN=1;
	BSF        PORTD+0, 5
;Traffic_Light.c,253 :: 		Left_Number= (i-15)/10;
	MOVLW      15
	SUBWF      _i+0, 0
	MOVWF      FLOC__Automatic+0
	CLRF       FLOC__Automatic+1
	BTFSS      STATUS+0, 0
	DECF       FLOC__Automatic+1, 1
	MOVLW      0
	BTFSC      _i+0, 7
	MOVLW      255
	ADDWF      FLOC__Automatic+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,254 :: 		Right_Number=(i-15)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,255 :: 		Left_Number2=(i-18)/10;
	MOVLW      18
	SUBWF      _i+0, 0
	MOVWF      FLOC__Automatic+0
	CLRF       FLOC__Automatic+1
	BTFSS      STATUS+0, 0
	DECF       FLOC__Automatic+1, 1
	MOVLW      0
	BTFSC      _i+0, 7
	MOVLW      255
	ADDWF      FLOC__Automatic+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,256 :: 		Right_Number2=(i-18)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,258 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Automatic59:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic60
;Traffic_Light.c,259 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,260 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,261 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,262 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,263 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,264 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic62:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic62
	DECFSZ     R12+0, 1
	GOTO       L_Automatic62
	NOP
	NOP
;Traffic_Light.c,266 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,267 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,268 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,269 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,270 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,271 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic63:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic63
	DECFSZ     R12+0, 1
	GOTO       L_Automatic63
	NOP
	NOP
;Traffic_Light.c,273 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,274 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,275 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,276 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,277 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,278 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic64:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic64
	DECFSZ     R12+0, 1
	GOTO       L_Automatic64
	NOP
	NOP
;Traffic_Light.c,280 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,281 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,282 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,283 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,284 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,285 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic65:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic65
	DECFSZ     R12+0, 1
	GOTO       L_Automatic65
	NOP
	NOP
;Traffic_Light.c,258 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,286 :: 		}
	GOTO       L_Automatic59
L_Automatic60:
;Traffic_Light.c,287 :: 		WEST_GREEN=0;
	BCF        PORTD+0, 5
;Traffic_Light.c,288 :: 		}
	GOTO       L_Automatic66
L_Automatic58:
;Traffic_Light.c,289 :: 		else if(i>15){
	MOVLW      128
	XORLW      15
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic67
;Traffic_Light.c,290 :: 		SOUTH_RED=1;
	BSF        PORTD+0, 0
;Traffic_Light.c,291 :: 		WEST_YELLOW=1;
	BSF        PORTD+0, 4
;Traffic_Light.c,293 :: 		Left_Number= (i-15)/10;
	MOVLW      15
	SUBWF      _i+0, 0
	MOVWF      FLOC__Automatic+2
	CLRF       FLOC__Automatic+3
	BTFSS      STATUS+0, 0
	DECF       FLOC__Automatic+3, 1
	MOVLW      0
	BTFSC      _i+0, 7
	MOVLW      255
	ADDWF      FLOC__Automatic+3, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+2, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+3, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Automatic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Automatic+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,294 :: 		Right_Number=(i-15)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+2, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+3, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,295 :: 		Left_Number2=(i-15)/10;
	MOVF       FLOC__Automatic+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,296 :: 		Right_Number2=(i-15)%10;
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,298 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Automatic68:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic69
;Traffic_Light.c,300 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,301 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,302 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,303 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,304 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,305 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic71:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic71
	DECFSZ     R12+0, 1
	GOTO       L_Automatic71
	NOP
	NOP
;Traffic_Light.c,307 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,308 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,309 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,310 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,311 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,312 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic72:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic72
	DECFSZ     R12+0, 1
	GOTO       L_Automatic72
	NOP
	NOP
;Traffic_Light.c,314 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,315 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,316 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,317 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,318 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,319 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic73:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic73
	DECFSZ     R12+0, 1
	GOTO       L_Automatic73
	NOP
	NOP
;Traffic_Light.c,321 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,322 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,323 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,324 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,325 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,326 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic74:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic74
	DECFSZ     R12+0, 1
	GOTO       L_Automatic74
	NOP
	NOP
;Traffic_Light.c,298 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,327 :: 		}
	GOTO       L_Automatic68
L_Automatic69:
;Traffic_Light.c,329 :: 		SOUTH_RED=0;
	BCF        PORTD+0, 0
;Traffic_Light.c,330 :: 		WEST_YELLOW=0;
	BCF        PORTD+0, 4
;Traffic_Light.c,331 :: 		}
	GOTO       L_Automatic75
L_Automatic67:
;Traffic_Light.c,332 :: 		else if (i>3){
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic76
;Traffic_Light.c,333 :: 		WEST_RED=1;
	BSF        PORTD+0, 3
;Traffic_Light.c,334 :: 		SOUTH_GREEN=1;
	BSF        PORTD+0, 2
;Traffic_Light.c,335 :: 		Left_Number= (i-3)/10;
	MOVLW      3
	SUBWF      _i+0, 0
	MOVWF      FLOC__Automatic+0
	CLRF       FLOC__Automatic+1
	BTFSS      STATUS+0, 0
	DECF       FLOC__Automatic+1, 1
	MOVLW      0
	BTFSC      _i+0, 7
	MOVLW      255
	ADDWF      FLOC__Automatic+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,336 :: 		Right_Number=(i-3)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Automatic+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Automatic+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,337 :: 		Left_Number2=(i)/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,338 :: 		Right_Number2=(i)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,340 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Automatic77:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic78
;Traffic_Light.c,341 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,342 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,343 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,344 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,345 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,346 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic80:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic80
	DECFSZ     R12+0, 1
	GOTO       L_Automatic80
	NOP
	NOP
;Traffic_Light.c,348 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,349 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,350 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,351 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,352 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,353 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic81:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic81
	DECFSZ     R12+0, 1
	GOTO       L_Automatic81
	NOP
	NOP
;Traffic_Light.c,355 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,356 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,357 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,358 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,359 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,360 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic82:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic82
	DECFSZ     R12+0, 1
	GOTO       L_Automatic82
	NOP
	NOP
;Traffic_Light.c,362 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,363 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,364 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,365 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,366 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,367 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic83:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic83
	DECFSZ     R12+0, 1
	GOTO       L_Automatic83
	NOP
	NOP
;Traffic_Light.c,340 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,368 :: 		}
	GOTO       L_Automatic77
L_Automatic78:
;Traffic_Light.c,369 :: 		SOUTH_GREEN=0;
	BCF        PORTD+0, 2
;Traffic_Light.c,370 :: 		}
	GOTO       L_Automatic84
L_Automatic76:
;Traffic_Light.c,371 :: 		else if(i>0){
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic85
;Traffic_Light.c,372 :: 		WEST_RED=1;
	BSF        PORTD+0, 3
;Traffic_Light.c,373 :: 		SOUTH_YELLOW=1;
	BSF        PORTD+0, 1
;Traffic_Light.c,374 :: 		Left_Number= (i)/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Automatic+0
	MOVF       FLOC__Automatic+0, 0
	MOVWF      _Left_Number+0
;Traffic_Light.c,375 :: 		Right_Number=(i)%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _Right_Number+0
;Traffic_Light.c,376 :: 		Left_Number2=(i)/10;
	MOVF       FLOC__Automatic+0, 0
	MOVWF      _Left_Number2+0
;Traffic_Light.c,377 :: 		Right_Number2=(i)%10;
	MOVF       R0+0, 0
	MOVWF      _Right_Number2+0
;Traffic_Light.c,379 :: 		for(j=0;j<40;++j){
	CLRF       _j+0
L_Automatic86:
	MOVLW      128
	XORWF      _j+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic87
;Traffic_Light.c,380 :: 		first_left_7seg=on;
	BCF        PORTB+0, 4
;Traffic_Light.c,381 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,382 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,383 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,384 :: 		portc=Left_Number;
	MOVF       _Left_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,385 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic89:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic89
	DECFSZ     R12+0, 1
	GOTO       L_Automatic89
	NOP
	NOP
;Traffic_Light.c,387 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,388 :: 		first_right_7seg=on;
	BCF        PORTB+0, 5
;Traffic_Light.c,389 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,390 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,391 :: 		portc=Right_Number;
	MOVF       _Right_Number+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,392 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic90:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic90
	DECFSZ     R12+0, 1
	GOTO       L_Automatic90
	NOP
	NOP
;Traffic_Light.c,394 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,395 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,396 :: 		second_left_7seg=on;
	BCF        PORTB+0, 6
;Traffic_Light.c,397 :: 		second_right_7seg=off;
	BSF        PORTB+0, 7
;Traffic_Light.c,398 :: 		portc=Left_Number2;
	MOVF       _Left_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,399 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic91:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic91
	DECFSZ     R12+0, 1
	GOTO       L_Automatic91
	NOP
	NOP
;Traffic_Light.c,401 :: 		first_left_7seg=off;
	BSF        PORTB+0, 4
;Traffic_Light.c,402 :: 		first_right_7seg=off;
	BSF        PORTB+0, 5
;Traffic_Light.c,403 :: 		second_left_7seg=off;
	BSF        PORTB+0, 6
;Traffic_Light.c,404 :: 		second_right_7seg=on;
	BCF        PORTB+0, 7
;Traffic_Light.c,405 :: 		portc=Right_Number2;
	MOVF       _Right_Number2+0, 0
	MOVWF      PORTC+0
;Traffic_Light.c,406 :: 		delay_ms(delay);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Automatic92:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic92
	DECFSZ     R12+0, 1
	GOTO       L_Automatic92
	NOP
	NOP
;Traffic_Light.c,379 :: 		for(j=0;j<40;++j){
	INCF       _j+0, 1
;Traffic_Light.c,407 :: 		}
	GOTO       L_Automatic86
L_Automatic87:
;Traffic_Light.c,408 :: 		SOUTH_YELLOW=0;
	BCF        PORTD+0, 1
;Traffic_Light.c,409 :: 		WEST_RED=0;
	BCF        PORTD+0, 3
;Traffic_Light.c,410 :: 		}
L_Automatic85:
L_Automatic84:
L_Automatic75:
L_Automatic66:
;Traffic_Light.c,249 :: 		for(i=38;i>=0;i--){
	DECF       _i+0, 1
;Traffic_Light.c,411 :: 		}
	GOTO       L_Automatic55
L_Automatic56:
;Traffic_Light.c,412 :: 		}
L_end_Automatic:
	RETURN
; end of _Automatic

_main:

;Traffic_Light.c,413 :: 		void main(){
;Traffic_Light.c,414 :: 		trisc=0;           // Set portc as output
	CLRF       TRISC+0
;Traffic_Light.c,415 :: 		trisd=0;           // Set portd as output
	CLRF       TRISD+0
;Traffic_Light.c,416 :: 		trisb=0b00000011;  // Set the first two pin(B0,B1)as input and the other as output
	MOVLW      3
	MOVWF      TRISB+0
;Traffic_Light.c,418 :: 		portd=0;           // Intialize portd off
	CLRF       PORTD+0
;Traffic_Light.c,419 :: 		portc=0;           // Intialize portc off
	CLRF       PORTC+0
;Traffic_Light.c,420 :: 		portb=0;           // Intialize portb off
	CLRF       PORTB+0
;Traffic_Light.c,422 :: 		GIE_bit=1;         // Enable all unmasked interrupt
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Traffic_Light.c,423 :: 		INTE_bit=1;        // Enable the internal interrupt
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;Traffic_Light.c,424 :: 		INTEDG_bit=0;      // Make the interrupt on falling edge
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;Traffic_Light.c,425 :: 		NOT_RBPU_bit=0;    // Portb pullup enabled
	BCF        NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0)
;Traffic_Light.c,427 :: 		while(1){
L_main93:
;Traffic_Light.c,428 :: 		delay_ms( 300*delay ) ;
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main95:
	DECFSZ     R13+0, 1
	GOTO       L_main95
	DECFSZ     R12+0, 1
	GOTO       L_main95
	DECFSZ     R11+0, 1
	GOTO       L_main95
	NOP
	NOP
;Traffic_Light.c,429 :: 		if( counter2%2==0 ){
	MOVLW      2
	MOVWF      R4+0
	MOVF       _counter2+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main96
;Traffic_Light.c,430 :: 		Automatic();
	CALL       _Automatic+0
;Traffic_Light.c,431 :: 		}
	GOTO       L_main97
L_main96:
;Traffic_Light.c,432 :: 		else Manual();
	CALL       _Manual+0
L_main97:
;Traffic_Light.c,433 :: 		}
	GOTO       L_main93
;Traffic_Light.c,434 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
