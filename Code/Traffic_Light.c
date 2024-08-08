#define SOUTH_RED          portd.b0
#define SOUTH_YELLOW       portd.b1
#define SOUTH_GREEN        portd.b2
#define WEST_RED           portd.b3
#define WEST_YELLOW        portd.b4
#define WEST_GREEN         portd.b5
#define first_left_7seg    portb.b4
#define first_right_7seg   portb.b5
#define second_left_7seg   portb.b6
#define second_right_7seg  portb.b7
#define delay              5
#define on                 0
#define off                1
#define manual            portb.b1
#define ModeSwitch         portb.b0

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

   if(manual==0){
      counter++;
   }
   if(counter>3){
      counter=0;
   }
   switch(counter){

     case(0):
           SOUTH_RED=0;
           WEST_RED=0;
           SOUTH_YELLOW=0;
           WEST_YELLOW=0;
           SOUTH_GREEN=0;
           WEST_GREEN=0;
           if(manual==0){
              counter++;
              break;
           }

           for(i=20;i>=0;i--){
              if(manual==0){
                counter++;
                break;
              }
              SOUTH_RED=1;
              WEST_GREEN=1;

              Left_Number= (i+3)/10;
              Right_Number=(i+3)%10;
              Left_Number2=(i)/10;
              Right_Number2=(i)%10;

              for(j=0;j<40;++j){
                 if(manual==0){
                    counter++;
                    break;
                 }
                 first_left_7seg=on;
                 first_right_7seg=off;
                 second_left_7seg=off;
                 second_right_7seg=off;
                 portc=Left_Number;
                 delay_ms(delay);

                 first_left_7seg=off;
                 first_right_7seg=on;
                 second_left_7seg=off;
                 second_right_7seg=off;
                 portc=Right_Number;
                 delay_ms(delay);

                 first_left_7seg=off;
                 first_right_7seg=off;
                 second_left_7seg=on;
                 second_right_7seg=off;
                 portc=Left_Number2;
                 delay_ms(delay);

                 first_left_7seg=off;
                 first_right_7seg=off;
                 second_left_7seg=off;
                 second_right_7seg=on;
                 portc=Right_Number2;
                 delay_ms(delay);
              }
           }
     case(1):
          WEST_YELLOW=1;
          WEST_GREEN=0;

          for(i=3;i>=0;i--){
              Left_Number= (i)/10;
              Right_Number=(i)%10;
              Left_Number2=(i)/10;
              Right_Number2=(i)%10;

            for(j=0;j<40;++j){

                     first_left_7seg=on;
                     first_right_7seg=off;
                     second_left_7seg=off;
                     second_right_7seg=off;
                     portc=Left_Number;
                     delay_ms(delay);

                     first_left_7seg=off;
                     first_right_7seg=on;
                     second_left_7seg=off;
                     second_right_7seg=off;
                     portc=Right_Number;
                     delay_ms(delay);

                     first_left_7seg=off;
                     first_right_7seg=off;
                     second_left_7seg=on;
                     second_right_7seg=off;
                     portc=Left_Number2;
                     delay_ms(delay);

                     first_left_7seg=off;
                     first_right_7seg=off;
                     second_left_7seg=off;
                     second_right_7seg=on;
                     portc=Right_Number2;
                     delay_ms(delay);
            }
          }
     case(2):
          if(manual==0){
             counter++;
             break;
          }
           WEST_YELLOW=0;
           SOUTH_RED=0;
           WEST_RED=1;
           SOUTH_GREEN=1;
           for(i=12;i>=0;i--){
               if(manual==0){
                  counter++;
                  break;
               }

               Left_Number= (i)/10;
               Right_Number=(i)%10;
               Left_Number2=(i+3)/10;
               Right_Number2=(i+3)%10;

               for(j=0;j<40;++j){
                  if(manual==0){
                     counter++;
                     break;
                  }

                      first_left_7seg=on;
                      first_right_7seg=off;
                      second_left_7seg=off;
                      second_right_7seg=off;
                      portc=Left_Number;
                      delay_ms(delay);

                      first_left_7seg=off;
                      first_right_7seg=on;
                      second_left_7seg=off;
                      second_right_7seg=off;
                      portc=Right_Number;
                      delay_ms(delay);

                      first_left_7seg=off;
                      first_right_7seg=off;
                      second_left_7seg=on;
                      second_right_7seg=off;
                      portc=Left_Number2;
                      delay_ms(delay);

                      first_left_7seg=off;
                      first_right_7seg=off;
                      second_left_7seg=off;
                      second_right_7seg=on;
                      portc=Right_Number2;
                      delay_ms(delay);
               }
           }
     case(3):
          SOUTH_GREEN=0;
          SOUTH_YELLOW=1;

          for(i=3;i>=0;i--){
              Left_Number= (i)/10;
              Right_Number=(i)%10;
              Left_Number2=(i)/10;
              Right_Number2=(i)%10;

              for(j=0;j<40;++j){

                  first_left_7seg=on;
                  first_right_7seg=off;
                  second_left_7seg=off;
                  second_right_7seg=off;
                  portc=Left_Number;
                  delay_ms(delay);

                  first_left_7seg=off;
                  first_right_7seg=on;
                  second_left_7seg=off;
                  second_right_7seg=off;
                  portc=Right_Number;
                  delay_ms(delay);

                  first_left_7seg=off;
                  first_right_7seg=off;
                  second_left_7seg=on;
                  second_right_7seg=off;
                  portc=Left_Number2;
                  delay_ms(delay);

                  first_left_7seg=off;
                  first_right_7seg=off;
                  second_left_7seg=off;
                  second_right_7seg=on;
                  portc=Right_Number2;
                  delay_ms(delay);
              }
          }
           break;
           counter=0;
    }
}
void Automatic(){
   SOUTH_RED=0;
   WEST_RED=0;
   SOUTH_YELLOW=0;
   WEST_YELLOW=0;
   SOUTH_GREEN=0;
   WEST_GREEN=0;
   for(i=38;i>=0;i--){
       if(i>18){
          SOUTH_RED=1;
          WEST_GREEN=1;
          Left_Number= (i-15)/10;
          Right_Number=(i-15)%10;
          Left_Number2=(i-18)/10;
          Right_Number2=(i-18)%10;

          for(j=0;j<40;++j){
              first_left_7seg=on;
              first_right_7seg=off;
              second_left_7seg=off;
              second_right_7seg=off;
              portc=Left_Number;
              delay_ms(delay);

              first_left_7seg=off;
              first_right_7seg=on;
              second_left_7seg=off;
              second_right_7seg=off;
              portc=Right_Number;
              delay_ms(delay);

              first_left_7seg=off;
              first_right_7seg=off;
              second_left_7seg=on;
              second_right_7seg=off;
              portc=Left_Number2;
              delay_ms(delay);

              first_left_7seg=off;
              first_right_7seg=off;
              second_left_7seg=off;
              second_right_7seg=on;
              portc=Right_Number2;
              delay_ms(delay);
          }
          WEST_GREEN=0;
       }
       else if(i>15){
               SOUTH_RED=1;
               WEST_YELLOW=1;

               Left_Number= (i-15)/10;
               Right_Number=(i-15)%10;
               Left_Number2=(i-15)/10;
               Right_Number2=(i-15)%10;

               for(j=0;j<40;++j){

                    first_left_7seg=on;
                    first_right_7seg=off;
                    second_left_7seg=off;
                    second_right_7seg=off;
                    portc=Left_Number;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=on;
                    second_left_7seg=off;
                    second_right_7seg=off;
                    portc=Right_Number;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=off;
                    second_left_7seg=on;
                    second_right_7seg=off;
                    portc=Left_Number2;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=off;
                    second_left_7seg=off;
                    second_right_7seg=on;
                    portc=Right_Number2;
                    delay_ms(delay);
               }

               SOUTH_RED=0;
               WEST_YELLOW=0;
       }
       else if (i>3){
                WEST_RED=1;
                SOUTH_GREEN=1;
                Left_Number= (i-3)/10;
                Right_Number=(i-3)%10;
                Left_Number2=(i)/10;
                Right_Number2=(i)%10;

                for(j=0;j<40;++j){
                    first_left_7seg=on;
                    first_right_7seg=off;
                    second_left_7seg=off;
                    second_right_7seg=off;
                    portc=Left_Number;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=on;
                    second_left_7seg=off;
                    second_right_7seg=off;
                    portc=Right_Number;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=off;
                    second_left_7seg=on;
                    second_right_7seg=off;
                    portc=Left_Number2;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=off;
                    second_left_7seg=off;
                    second_right_7seg=on;
                    portc=Right_Number2;
                    delay_ms(delay);
                }
                SOUTH_GREEN=0;
       }
       else if(i>0){
               WEST_RED=1;
               SOUTH_YELLOW=1;
               Left_Number= (i)/10;
               Right_Number=(i)%10;
               Left_Number2=(i)/10;
               Right_Number2=(i)%10;

               for(j=0;j<40;++j){
                    first_left_7seg=on;
                    first_right_7seg=off;
                    second_left_7seg=off;
                    second_right_7seg=off;
                    portc=Left_Number;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=on;
                    second_left_7seg=off;
                    second_right_7seg=off;
                    portc=Right_Number;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=off;
                    second_left_7seg=on;
                    second_right_7seg=off;
                    portc=Left_Number2;
                    delay_ms(delay);

                    first_left_7seg=off;
                    first_right_7seg=off;
                    second_left_7seg=off;
                    second_right_7seg=on;
                    portc=Right_Number2;
                    delay_ms(delay);
               }
                    SOUTH_YELLOW=0;
                    WEST_RED=0;
       }
    }
}
void main(){
      trisc=0;           // Set portc as output
      trisd=0;           // Set portd as output
      trisb=0b00000011;  // Set the first two pin(B0,B1)as input and the other as output

      portd=0;           // Intialize portd off
      portc=0;           // Intialize portc off
      portb=0;           // Intialize portb off

      GIE_bit=1;         // Enable all unmasked interrupt
      INTE_bit=1;        // Enable the internal interrupt
      INTEDG_bit=0;      // Make the interrupt on falling edge
      NOT_RBPU_bit=0;    // Portb pullup enabled

      while(1){
         delay_ms( 300*delay ) ;
         if( counter2%2==0 ){
             Automatic();
         }
         else Manual();
      }
}