#line 1 "C:/Users/Ahmed/Desktop/New folder (2)/AA/Traffic_Light.c"
#line 17 "C:/Users/Ahmed/Desktop/New folder (2)/AA/Traffic_Light.c"
signed char i;
signed char j;
signed char Left_Number;
signed char Right_Number;
signed char Left_Number2;
signed char Right_Number2;
signed char counter=0;
signed char counter2=0;

void interrupt(){
 if(INTF_bit==1){
 INTF_bit=0;
 counter2++;
 }
}
void Manual(){

 if( portb.b1 ==0){
 counter++;
 }
 if(counter>3){
 counter=0;
 }
 switch(counter){

 case(0):
  portd.b0 =0;
  portd.b3 =0;
  portd.b1 =0;
  portd.b4 =0;
  portd.b2 =0;
  portd.b5 =0;
 if( portb.b1 ==0){
 counter++;
 break;
 }

 for(i=20;i>=0;i--){
 if( portb.b1 ==0){
 counter++;
 break;
 }
  portd.b0 =1;
  portd.b5 =1;

 Left_Number= (i+3)/10;
 Right_Number=(i+3)%10;
 Left_Number2=(i)/10;
 Right_Number2=(i)%10;

 for(j=0;j<40;++j){
 if( portb.b1 ==0){
 counter++;
 break;
 }
  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
 }
 case(1):
  portd.b4 =1;
  portd.b5 =0;

 for(i=3;i>=0;i--){
 Left_Number= (i)/10;
 Right_Number=(i)%10;
 Left_Number2=(i)/10;
 Right_Number2=(i)%10;

 for(j=0;j<40;++j){

  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
 }
 case(2):
 if( portb.b1 ==0){
 counter++;
 break;
 }
  portd.b4 =0;
  portd.b0 =0;
  portd.b3 =1;
  portd.b2 =1;
 for(i=12;i>=0;i--){
 if( portb.b1 ==0){
 counter++;
 break;
 }

 Left_Number= (i)/10;
 Right_Number=(i)%10;
 Left_Number2=(i+3)/10;
 Right_Number2=(i+3)%10;

 for(j=0;j<40;++j){
 if( portb.b1 ==0){
 counter++;
 break;
 }

  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
 }
 case(3):
  portd.b2 =0;
  portd.b1 =1;

 for(i=3;i>=0;i--){
 Left_Number= (i)/10;
 Right_Number=(i)%10;
 Left_Number2=(i)/10;
 Right_Number2=(i)%10;

 for(j=0;j<40;++j){

  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
 }
 break;
 counter=0;
 }
}
void Automatic(){
  portd.b0 =0;
  portd.b3 =0;
  portd.b1 =0;
  portd.b4 =0;
  portd.b2 =0;
  portd.b5 =0;
 for(i=38;i>=0;i--){
 if(i>18){
  portd.b0 =1;
  portd.b5 =1;
 Left_Number= (i-15)/10;
 Right_Number=(i-15)%10;
 Left_Number2=(i-18)/10;
 Right_Number2=(i-18)%10;

 for(j=0;j<40;++j){
  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
  portd.b5 =0;
 }
 else if(i>15){
  portd.b0 =1;
  portd.b4 =1;

 Left_Number= (i-15)/10;
 Right_Number=(i-15)%10;
 Left_Number2=(i-15)/10;
 Right_Number2=(i-15)%10;

 for(j=0;j<40;++j){

  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }

  portd.b0 =0;
  portd.b4 =0;
 }
 else if (i>3){
  portd.b3 =1;
  portd.b2 =1;
 Left_Number= (i-3)/10;
 Right_Number=(i-3)%10;
 Left_Number2=(i)/10;
 Right_Number2=(i)%10;

 for(j=0;j<40;++j){
  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
  portd.b2 =0;
 }
 else if(i>0){
  portd.b3 =1;
  portd.b1 =1;
 Left_Number= (i)/10;
 Right_Number=(i)%10;
 Left_Number2=(i)/10;
 Right_Number2=(i)%10;

 for(j=0;j<40;++j){
  portb.b4 = 0 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Left_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 0 ;
  portb.b6 = 1 ;
  portb.b7 = 1 ;
 portc=Right_Number;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 0 ;
  portb.b7 = 1 ;
 portc=Left_Number2;
 delay_ms( 5 );

  portb.b4 = 1 ;
  portb.b5 = 1 ;
  portb.b6 = 1 ;
  portb.b7 = 0 ;
 portc=Right_Number2;
 delay_ms( 5 );
 }
  portd.b1 =0;
  portd.b3 =0;
 }
 }
}
void main(){
 trisc=0;
 trisd=0;
 trisb=0b00000011;

 portd=0;
 portc=0;
 portb=0;

 GIE_bit=1;
 INTE_bit=1;
 INTEDG_bit=0;
 NOT_RBPU_bit=0;

 while(1){
 delay_ms( 300* 5  ) ;
 if( counter2%2==0 ){
 Automatic();
 }
 else Manual();
 }
}
